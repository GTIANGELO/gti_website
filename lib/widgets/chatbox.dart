import 'package:flutter/material.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/widgets/navbar.dart';

class ChatBoxPanel extends StatefulWidget {
  final ValueNotifier<bool> isOpenNotifier;

  const ChatBoxPanel({
    super.key,
    required this.isOpenNotifier,
  });

  static ChatBoxPanelState? of(BuildContext context, {bool nullOk = false}) {
    return context.findAncestorStateOfType<ChatBoxPanelState>();
  }

  @override
  State<ChatBoxPanel> createState() => ChatBoxPanelState();
}

class ChatBoxPanelState extends State<ChatBoxPanel>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController message = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _isOpen = false;
  bool get isOpen => _isOpen;

  final List<Map<String, String>> _messages = [];

  void toggle() {
    _isOpen = !_isOpen;
    widget.isOpenNotifier.value = _isOpen;
    _isOpen ? _controller.forward() : _controller.reverse();
    setState(() {});
  }

  void open() {
    _isOpen = true;
    widget.isOpenNotifier.value = true;
    _controller.forward();
    setState(() {});
  }

  void close() {
    _isOpen = false;
    widget.isOpenNotifier.value = false;
    _controller.reverse();
    setState(() {});
  }

  void _handleSend() {
    final text = message.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.removeWhere((msg) => msg['type'] == 'faq_card');

        _messages.add({'text': text, 'type': 'user'});
        _messages.add({
          'text': "We've received your message. We'll get back to you shortly!",
          'type': 'system',
        });

        _messages.add({'type': 'faq_card'});
      });
      message.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    final alreadyHasCard = _messages.any((msg) => msg['type'] == 'faq_card');
    if (!alreadyHasCard) {
      setState(() {
        _messages.add({'type': 'faq_card'});
      });

      _scrollToBottom();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFaqCard() {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Variables.faqQuestions.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey, height: 12),
              itemBuilder: (context, index) {
                final faq = Variables.faqQuestions[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _messages.add({
                        'text': faq['question']!,
                        'type': 'user',
                      });
                      _messages.add({
                        'text': faq['answer']!,
                        'type': 'system',
                      });
                    });
                    _scrollToBottom();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      faq['question']!,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_isOpen,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 20, // Add padding from the right edge (NOT flush)
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Material(
                  elevation: 30, // High to ensure it's over the FAB
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    width: 420, // Wider panel
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: utilityFunctions
                                .getThemeColors(context)["primary"]!
                                .withValues(alpha: 0.7),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "FAQ's",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.close),
                                onPressed: close,
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: ListView(
                              controller: _scrollController,
                              padding: EdgeInsets.zero,
                              children: [
                                ..._messages.map((msg) {
                                  if (msg['type'] == 'faq_card') {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child:
                                          _buildFaqCard(), // Same card builder as before
                                    );
                                  }

                                  final isUser = msg['type'] == 'user';
                                  return Align(
                                    alignment: isUser
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        constraints:
                                            const BoxConstraints(maxWidth: 300),
                                        decoration: BoxDecoration(
                                          color: isUser
                                              ? Colors.blue[100]
                                              : Colors.grey[200],
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(12),
                                            topRight: const Radius.circular(12),
                                            bottomLeft: Radius.circular(
                                                isUser ? 12 : 0),
                                            bottomRight: Radius.circular(
                                                isUser ? 0 : 12),
                                          ),
                                        ),
                                        child: Text(
                                          msg['text'] ?? '',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border: const Border(
                              top: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: message,
                                  decoration: InputDecoration(
                                    hintText: 'Type your message...',
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: utilityFunctions.getThemeColors(
                                            context)["primary"]!,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: Icon(Icons.send,
                                    color: utilityFunctions
                                        .getThemeColors(context)["primary"]!),
                                onPressed: _handleSend,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
