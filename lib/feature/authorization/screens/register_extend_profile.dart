import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player.dart';
import 'package:projekt_481_play_with_me/feature/info_players/models/player_storage.dart';
import 'package:projekt_481_play_with_me/feature/info_players/repositories/player_avatar_images.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

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
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();

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

  Future<void> _saveData() async {
    final player = Player(
      eMail: _email,
      password: _password,
      firstName: _nameController.text,
      lastName: _lastNameController.text,
      nickName: _nickNameController.text,
      avatarUrl: _selectedAvatar,
    );

    List<Player> players = [player];
    await PlayerStorage.savePlayers(players);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationWrapper()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: Container(
          width: 430,
          height: 900,
          padding:
              const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 1,
                  left: 320,
                  child: IconButton(
                    iconSize: 48,
                    icon: const Icon(Icons.photo_library, color: Colors.blue),
                    onPressed:
                        _pickImage, // Вызов функции для выбора изображения
                    tooltip: 'Wählen Sie ein Foto aus der Galerie aus',
                  ),
                ),
                // Text oben
                const Positioned(
                  top: 2,
                  left: 110,
                  child: Text("Erstelle deinen eigenen Avatar"),
                ),
                // Avatar
                Positioned(
                  top: 30,
                  left: 140,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: ExactAssetImage(_selectedAvatar),
                  ),
                ),

                // List Avatar
                Positioned(
                  top: 150,
                  left: 85,
                  child: SizedBox(
                    width: 250,
                    height: 100,
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
                              backgroundImage: ExactAssetImage(avatars[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //==============================================================
                //===========================================  Begin TextFields

                //____________________________ Name
                Positioned(
                  top: 250,
                  left: 40,
                  right: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Name"),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    validator: isValidText,
                  ),
                ),
                //____________________________ Nachname
                Positioned(
                  top: 310,
                  left: 40,
                  right: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Nachname"),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    validator: isValidText,
                  ),
                ),
                //____________________________ Spitzname
                Positioned(
                  top: 370,
                  left: 40,
                  right: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Spitzname"),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    validator: isValidText,
                  ),
                ),
                Positioned(
                  top: 570,
                  left: 130,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveData();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
