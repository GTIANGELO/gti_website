import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gti_website/functions/responsive_utils.dart';
import 'package:gti_website/functions/reusable_variables.dart';
import 'package:gti_website/functions/utility_functions.dart';

final utilityFunctions = UtilityFunctions();

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const NavBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(158);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // double width = constraints.maxWidth;
            final screenSize = getScreenSize(constraints.maxWidth);
            if (screenSize.isExtraLarge) {
              return _buildExtraFullNav(context);
            } else if (screenSize.isLarge) {
              return _buildFullNav(context);
            } else if (screenSize.isMedium) {
              return _buildMediumNav(context);
            } else if (screenSize.isSmall) {
              return _buildSmallNav(context);
            }
            return const Center(child: Text('Unsupported screen size'));
          },
        ),
      ),
    );
  }

  Widget _buildLogo(double size) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size,
      ),
      child: ClipRRect(
        child: Image.asset(
          'assets/gti_logo_2.png',
          fit: BoxFit.contain, // ensures full image is shown
        ),
      ),
    );
  }

  Widget _buildNavItems(BuildContext context, List<Map<String, String>> items) {
    return Row(
      children: items
          .map((item) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30), // ← spacing
                child: _NavItem(
                  label: item['label']!,
                  route: item['route']!,
                  color: utilityFunctions.getThemeColors(context)["secondary"]!,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildExtraFullNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["tertiary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                child: _buildLogo(90),
              ),
              const Spacer(),
              _buildNavItems(context, Variables.navItemsTop),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["secondary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Variables.navItemsDropdown
                .map(
                  (dropdown) => Expanded(
                    child: NavItemDropdown(
                      fontSize: 18,
                      label: dropdown['label'] as String,
                      items: dropdown['items'] as List<Map<String, String>>,
                      color:
                          utilityFunctions.getThemeColors(context)["tertiary"]!,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFullNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["tertiary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                child: _buildLogo(90),
              ),
              const Spacer(),
              _buildNavItems(context, Variables.navItemsTop),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["secondary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Variables.navItemsDropdown
                .map(
                  (dropdown) => Expanded(
                    child: NavItemDropdown(
                      fontSize: 18,
                      label: dropdown['label'] as String,
                      items: dropdown['items'] as List<Map<String, String>>,
                      color:
                          utilityFunctions.getThemeColors(context)["tertiary"]!,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMediumNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["tertiary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: _buildLogo(60),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.menu,
                    color:
                        utilityFunctions.getThemeColors(context)["secondary"]!),
                iconSize: 20,
                onPressed: () {
                  scaffoldKey?.currentState
                      ?.openDrawer(); // Open the drawer here
                },
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["secondary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ],
    );
  }

  Widget _buildSmallNav(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["tertiary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: _buildLogo(60),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.menu,
                    color:
                        utilityFunctions.getThemeColors(context)["secondary"]!),
                iconSize: 20,
                onPressed: () {
                  scaffoldKey?.currentState
                      ?.openDrawer(); // Open the drawer here
                },
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: utilityFunctions.getThemeColors(context)["secondary"],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final String route;
  final Color color;

  const _NavItem({
    required this.label,
    required this.route,
    required this.color,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 15,
                color: widget.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: 4,
              width: currentRoute == widget.route
                  ? 40
                  : _isHovered
                      ? 40
                      : 0,
              margin: const EdgeInsets.only(top: 4),
              color: utilityFunctions.getThemeColors(context)["primary"]!,
            ),
          ],
        ),
      ),
    );
  }
}

class NavItemDropdown extends StatefulWidget {
  final String label;
  final List<Map<String, String>> items;
  final Color color;
  final double fontSize;

  const NavItemDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.color,
    required this.fontSize,
  });

  // 🔹 Static reference to the active dropdown
  static _NavItemDropdownState? _activeDropdown;

  @override
  State<NavItemDropdown> createState() => _NavItemDropdownState();
}

class _NavItemDropdownState extends State<NavItemDropdown>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _hoverTimer;
  bool _isHovered = false;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.02),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    if (NavItemDropdown._activeDropdown != null &&
        NavItemDropdown._activeDropdown != this) {
      NavItemDropdown._activeDropdown!._removeOverlay();
    }

    NavItemDropdown._activeDropdown = this;

    _overlayEntry = _buildOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward(from: 0);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _animationController.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;

        if (NavItemDropdown._activeDropdown == this) {
          NavItemDropdown._activeDropdown = null;
        }
      });
    }
  }

  void _setHover(bool hover) {
    _hoverTimer?.cancel();

    if (hover) {
      setState(() => _isHovered = true);
      _showOverlay();
    } else {
      _hoverTimer = Timer(const Duration(milliseconds: 10), () {
        if (!_isHovered) {
          _removeOverlay();
          setState(() => _isHovered = false);
        }
      });
      setState(() => _isHovered = false);
    }
  }

  OverlayEntry _buildOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Transparent layer that catches taps outside the dropdown
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _setHover(false); // Close dropdown on outside tap
              },
            ),
          ),
          Positioned(
            width: size.width, // Match the width of the menu item
            left: offset.dx,
            top: offset.dy + size.height,
            child: MouseRegion(
              onEnter: (_) => _setHover(true),
              onExit: (_) => _setHover(false),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.items
                            .map(
                              (item) => Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    context.go(item['route']!);
                                    _setHover(false);
                                  },
                                  hoverColor: utilityFunctions
                                      .getThemeColors(context)["secondary"]!
                                      .withValues(alpha: 0.1),
                                  child: Container(
                                    width: size.width,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      item['label']!,
                                      style: TextStyle(
                                        fontSize: widget.fontSize,
                                        color: utilityFunctions.getThemeColors(
                                            context)["secondary"]!,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
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

  @override
  void dispose() {
    _hoverTimer?.cancel();
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label == 'CUSTOMERS') {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            context.go('/customers');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(fontSize: 12, color: widget.color),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: GestureDetector(
          onTap: () {
            _setHover(true);
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(fontSize: 12, color: widget.color),
                ),
                Icon(
                  Icons.expand_more_outlined,
                  color: widget.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
