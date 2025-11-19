class Student {
  final String name;
  final String email;
  final String phone;
  final String branch;

  Student({
    required this.name,
    required this.email,
    required this.phone,
    required this.branch,
  });
}

final List<Student> studentsList = [
  Student(
    name: 'Nagarjuna',
    email: "nagarjuna@gmail.com",
    phone: "6301607787",
    branch: "EEE",
  ),
  Student(
    name: 'Likitha',
    email: 'likitha@gmail.com',
    phone: '9876543211',
    branch: 'ECE',
  ),
  Student(
    name: 'Arjun',
    email: 'arjun@gmail.com',
    phone: '9876543212',
    branch: 'MECH',
  ),
  Student(
    name: 'Harsha',
    email: 'harsha@gmail.com',
    phone: '9876543213',
    branch: 'IT',
  ),
  Student(
    name: 'Deepika',
    email: 'deepika@gmail.com',
    phone: '9876543214',
    branch: 'EEE',
  ),
  Student(
    name: 'Ravi',
    email: 'ravi@gmail.com',
    phone: '9876543215',
    branch: 'CSE',
  ),
];
