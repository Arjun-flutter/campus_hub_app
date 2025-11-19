import 'package:flutter/material.dart';
import '../ widgets/header_clipper.dart';
import '../models/student.dart';
import '../utils/avatar_utils.dart';
import 'student_profile_screen.dart';
import '../main.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen>
    with SingleTickerProviderStateMixin {
  late List<Student> filtered;
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    filtered = List.from(studentsList);
  }

  void _filter(String q) {
    final lower = q.toLowerCase();
    setState(() {
      filtered = studentsList
          .where(
            (s) =>
                s.name.toLowerCase().contains(lower) ||
                s.branch.toLowerCase().contains(lower) ||
                s.email.toLowerCase().contains(lower),
          )
          .toList();
    });
  }

  Route _profileRoute(Student s) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => StudentProfileScreen(student: s),
      transitionsBuilder: (c, anim, sec, child) {
        return FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? const LinearGradient(
                  colors: [Color(0xFF0B0F12), Color(0xFF101217)],
                )
              : const LinearGradient(
                  colors: [Color(0xFFF5F7FB), Color(0xFFEFEFF4)],
                ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 170,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4F8EF7), Color(0xFF2E6BCE)],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Campus Hub',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},

                            icon: Icon(
                              isDark ? Icons.light_mode : Icons.dark_mode,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.white12 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _search,
                          onChanged: _filter,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search students...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final s = filtered[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, _profileRoute(s)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: "avatar-${s.name}",
                              child: Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: avatarGradient(s.name),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    s.name[0].toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  s.branch,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
