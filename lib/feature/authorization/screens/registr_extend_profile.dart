import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projekt_481_play_with_me/feature/players/models/player.dart';
import 'package:projekt_481_play_with_me/feature/players/models/player_storage.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/player_avatar_images.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';
import 'package:projekt_481_play_with_me/feature/players/repositories/storage_repository_player.dart';
import 'package:provider/provider.dart';

class RegistrationDataScreen extends StatefulWidget {
  final String email;
  final String password;

  const RegistrationDataScreen(
      {super.key, required this.email, required this.password});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationDataScreenState createState() => _RegistrationDataScreenState();
}

class _RegistrationDataScreenState extends State<RegistrationDataScreen> {
  // Variable to store the selected avatar
  String _selectedAvatar = 'assets/images_avatar/avatar1.png';
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _password = widget.password;
    _loadPlayers();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerNickname = TextEditingController();
  final TextEditingController _controllerMobilnum = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  // choose a new avatar or image
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedAvatar = image.path;
      });
    }
  }

//_______________ Valid Name Nachname Spitzname
  String? isValidText(String? value) {
    if (value == null || value.isEmpty) return "Bitte ein text angeben";
    if (value.length < 4) return "text is to short (4 chars minimum)";
    return null;
  }

//======================================= SAVE DATA TO SHAREDPREFERENCES
  List<Player> _players = [];
// abruffen alle exestierte players
  Future<void> _loadPlayers() async {
    // _players = await PlayerStorage.loadPlayers();
    _players = await context.read<StorageRepositoryPlayer>().loadPlayers();

    setState(() {});
  }

  Future<void> _addPlayers() async {
    final newPlayer = Player(
      eMail: _email,
      password: _password,
      firstName: _controllerName.text,
      lastName: _controllerLastname.text,
      nickName: _controllerNickname.text,
      avatarUrl: _selectedAvatar,
      mobileNumber: _controllerMobilnum.text,
    );

    setState(() {
      _players.add(newPlayer);
    });

    // List<Player> players = [player];
    //await PlayerStorage.savePlayers(_players);
    await context.read<StorageRepositoryPlayer>().savePlayers(_players);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationWrapper()));
  }

  void _clearFields() {
    //  TODO clear alle felder
  }

//=======================================
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/new_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: Container(
          width: 430,
          height: 900,
          padding: const EdgeInsets.only(top: 70, bottom: 0, left: 0, right: 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Text oben
                const Text(
                  "Erstelle deinen eigenen Avatar (optional)",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    // List Avatar
                    SizedBox(
                      width: 270,
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: avatars.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedAvatar = avatars[index];

                                /// Update the selected avatar
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    ExactAssetImage(avatars[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Pic Image
                    IconButton(
                      iconSize: 48,
                      icon: const Icon(Icons.photo_library, color: Colors.blue),
                      onPressed:
                          _pickImage, // Вызов функции для выбора изображения
                      tooltip: 'Wählen Sie ein Foto aus der Galerie aus',
                    ),
                  ],
                ),

                // Avatar
                CircleAvatar(
                  radius: 70,
                  backgroundImage: ExactAssetImage(_selectedAvatar),
                ),
//
                //===========================================  Begin TextFields
//
                //____________________________ Name
                TextFormField(
                  controller: _controllerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    label: Text("Name"),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  validator: isValidText,
                ),
                //____________________________ Nachname
                TextFormField(
                  controller: _controllerLastname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    label: Text("Nachname"),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  validator: isValidText,
                ),
                //____________________________ Spitzname
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _controllerNickname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Spitzname (optional)"),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        validator: isValidText,
                      ),
                    ),
                    const SizedBox(
                        width: 10), //____________________________ Handynummer

                    SizedBox(
                      width: 180,
                      child: TextFormField(
                        controller: _controllerMobilnum,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Handynummer (optional)"),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        validator: isValidText,
                      ),
                    ),
                  ],
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addPlayers();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                              child: Text("Daten erfolgreich gespeichert.")),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          margin: EdgeInsets.only(bottom: 70.0),
                          content: Center(
                              child: Text("Daten müssen korrigiert werden.")),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Speichern",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
