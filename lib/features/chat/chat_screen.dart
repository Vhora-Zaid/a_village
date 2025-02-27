import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/chat_provider.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Stella Walsh',
      'Lottie Glover',
      'Mildred Butler',
      'Cameron Pena',
      'Victoria Norris',
      'Maggie Price',
      'Esther Kim',
      'Augusta Matthews'
    ];
    final List<String> profileImages = [
      ImageStrings.profile1,
      ImageStrings.profile2,
      ImageStrings.profile3,
      ImageStrings.profile4,
      ImageStrings.profile5,
      ImageStrings.profile6,
      ImageStrings.profile7,
      ImageStrings.profile8
    ];
    final List<String> senderProfileImages = [
      ImageStrings.profile5,
      ImageStrings.profile7,
      ImageStrings.profile6,
      ImageStrings.profile8,
      ImageStrings.profile2,
      ImageStrings.profile4,
      ImageStrings.profile1,
      ImageStrings.profile3
    ];
    final List<String> initialMessages = [
      'Hey! How\'s it going?',
      'What kind of music do you like?',
      'Sounds good to me!',
      'What is your favorite color?',
      'Sounds good to me!',
      'What is your favorite color?',
      'I like red',
      'What is your favorite color?'
    ];

    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final chatProvider = Provider.of<ChatProvider>(context);
    final chatMessages = chatProvider.getChatMessages(index);

    if (chatMessages.isEmpty) {
      chatProvider.addInitialMessage(index, initialMessages[index]);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: TColors.chatGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                ImageStrings.backarrow,
                height: 44,
                width: 44,
              ),
            ),
          ),
          title: Text(
            names[index],
            style: TextStyle(
              color: TColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.interregular,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, messageIndex) {
                  final message = chatMessages[messageIndex];
                  final bool isSentByUser = message["isSentByUser"];
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: isSentByUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isSentByUser)
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:
                            AssetImage(senderProfileImages[index]),
                          ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: isSentByUser
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 26, vertical: 14),
                                decoration: BoxDecoration(
                                  color: isSentByUser
                                      ? TColors.blue
                                      : TColors.yellow,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                    Radius.circular(isSentByUser ? 50 : 0),
                                    topRight:
                                    Radius.circular(isSentByUser ? 0 : 50),
                                    bottomLeft: const Radius.circular(50),
                                    bottomRight: const Radius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  message["text"],
                                  style: TextStyle(
                                    color: isSentByUser
                                        ? TColors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 15, top: 4),
                                child: Text(
                                  message["timestamp"],
                                  style: TextStyle(
                                    color: TColors.chattime,
                                    fontSize: 12,
                                    fontFamily: AppFonts.interregular,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSentByUser)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(profileImages[index]),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: TColors.grey,
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(16, 10, 11, 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: TColors.searchborder,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: TColors.searchborder,
                            width: 1.0,
                          ),
                        ),
                        hintText: AppLocalizations.of(context)!.writehere,
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: TColors.placeholder,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(ImageStrings.send, height: 24, width: 24),
                    onPressed: () {
                      chatProvider.sendMessage(index, _messageController.text);
                      _messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
