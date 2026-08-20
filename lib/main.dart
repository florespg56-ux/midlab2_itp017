import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 240, 66, 211)),
        useMaterial3: true,
      ),
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  int _likeCount = 0;

  void _incrementLike() {
    setState(() {
      _likeCount++;
    });
  }

  void _showMottoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('My Motto'),
        content: const Text(
          '"Tandaan ang buhay ay weder weder lang."',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: const Color.fromARGB(255, 104, 25, 114),
        foregroundColor: const Color.fromARGB(255, 204, 159, 204),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isWideScreen ? _buildSideBySideLayout() : _buildStackedLayout(),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 223, 51, 208),
              child: CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage(
                  'lib/assets/me.jpg',
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Peter Angelo G. Flores',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'BS Information Technology • 3rd Year (3IT-A)',
              style: TextStyle(
                color: const Color.fromARGB(255, 117, 8, 76),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _incrementLike,
              icon: const Icon(Icons.thumb_up),
              label: Text('Applaud ($_likeCount)'),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: _showMottoDialog,
              icon: const Icon(Icons.format_quote),
              label: const Text('View Motto'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideBySideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: _buildProfileHeader(),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              _buildPersonalCard(),
              const SizedBox(height: 16),
              _buildAcademicCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStackedLayout() {
    return Column(
      children: [
        _buildProfileHeader(),
        const SizedBox(height: 16),
        _buildPersonalCard(),
        const SizedBox(height: 16),
        _buildAcademicCard(),
      ],
    );
  }

  Widget _buildPersonalCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 98, 17, 122)),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Full Name'),
              subtitle: Text('Peter Angelo G. Flores'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.badge, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Nickname'),
              subtitle: Text('Petmalu'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.star, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Age'),
              subtitle: Text('24 Years Old'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.cake, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Birthday'),
              subtitle: Text('October 28, 2001'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.home, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Address'),
              subtitle: Text('123 kalye pogi, sitio ako lng pogi'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.sports_esports, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Hobby'),
              subtitle: Text('Matulog at mag relapse'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.format_quote, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Motto'),
              subtitle: Text('"Tandaan ang buhay ay weder weder lang."'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.school, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Course / Program'),
              subtitle: Text('Bachelor of Science in Information Technology'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.class_, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Year Level'),
              subtitle: Text('3rd Year, Irregular'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.group, color: Color.fromARGB(255, 167, 14, 103)),
              title: Text('Section'),
              subtitle: Text('3IT-A'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Academic Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 98, 17, 122)),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.book, color: Color.fromARGB(255, 1, 77, 54)),
              title: Text('Favorite Subject'),
              subtitle: Text('ITP-107, Matulog at maglaro'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.code, color: Color.fromARGB(255, 1, 77, 54)),
              title: Text('Programming Languages'),
              subtitle: Text('Dart, Java, JavaScript,HTML,CSS'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.build, color: Color.fromARGB(255, 1, 77, 54)),
              title: Text('Technical Skills'),
              subtitle: Text('Git/GitHub, Tulala pag wala '),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.flag, color: Color.fromARGB(255, 1, 77, 54)),
              title: Text('Career Goal'),
              subtitle: Text('Sana di na ako batak mag relapse'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.psychology, color: Color.fromARGB(255, 1, 77, 54)),
              title: Text('Academic Interest'),
              subtitle: Text('Diko ako po alam, Nag try lng ako kung masaya ba'),
            ),
          ],
        ),
      ),
    );
  }
}