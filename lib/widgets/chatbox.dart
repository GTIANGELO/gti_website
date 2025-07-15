import 'package:flutter/material.dart';
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
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isOpen = false;
  bool get isOpen => _isOpen;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                        const Expanded(
                          child: Center(child: Text("Chat content here...")),
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
