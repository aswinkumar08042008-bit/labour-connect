import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
List<Map<String, String>> postedJobs = [];
List<Map<String, String>> applications = [];
List<Map<String, String>> workerRequests = [];
String workStatus = 'Not Started';
String generatedOtp = '';
bool otpGenerated = false;
bool workConfirmed = false;
String? uploadedIdProofPath;

void main() {
  runApp(const LocalLabourConnect());
}

class LocalLabourConnect extends StatelessWidget {
  const LocalLabourConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Labour Connect',
      home: const LoginScreen(),
    );
  }
}

class LoginDetailsScreen extends StatefulWidget {
  const LoginDetailsScreen({super.key});

  @override
  State<LoginDetailsScreen> createState() =>
      _LoginDetailsScreenState();
}
class LoginOtpScreen extends StatelessWidget {
  const LoginOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login OTP'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.lock_open,
              size: 75,
            ),

            const SizedBox(height: 20),

            const Text(
              'Enter Login OTP',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'For testing, use OTP 123456',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            TextField(
              controller: otpController,

              keyboardType:
                  TextInputType.number,

              maxLength: 6,

              textAlign: TextAlign.center,

              decoration: const InputDecoration(
                labelText: '6-digit OTP',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {

                  if (otpController.text ==
                      '123456') {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RoleSelectionScreen(),
                      ),
                    );

                  } else {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Invalid OTP',
                        ),
                      ),
                    );
                  }
                },

                child: const Text(
                  'VERIFY OTP',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _LoginDetailsScreenState
    extends State<LoginDetailsScreen> {

  final TextEditingController mobileController =
      TextEditingController();

  void continueLogin() {

    if (mobileController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter a valid 10-digit mobile number',
          ),
        ),
      );

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const LoginOtpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.phone_android,
              size: 70,
            ),

            const SizedBox(height: 20),

            const Text(
              'Enter your mobile number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: mobileController,

              keyboardType:
                  TextInputType.phone,

              maxLength: 10,

              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: continueLogin,

                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Labour Connect'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.people,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              'Local Labour Connect',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Connect workers with people who need them.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LoginDetailsScreen(),
                    ),
                  );
                },

                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RegistrationScreen(),
                  ),
                );
              },

              child: const Text(
                'First time here? Create an account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Labour Connect'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Center(
                child: Icon(
                  Icons.people,
                  size: 80,
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'Create your profile to get started',
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: const Icon(Icons.home),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Location / Area',
                  prefixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const OtpScreen(),
    ),
  );
},

                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Mobile Number'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.sms,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Enter the OTP sent to your mobile number',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,

              decoration: InputDecoration(
                labelText: '6-digit OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const IdProofScreen(),
                    ),
                  );

                },

                child: const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextButton(
              onPressed: () {
                print('Resend OTP');
              },

              child: const Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
class IdProofScreen extends StatefulWidget {
  const IdProofScreen({super.key});

  @override
  State<IdProofScreen> createState() => _IdProofScreenState();
}

class _IdProofScreenState extends State<IdProofScreen> {
  String selectedId = 'No ID proof selected';

  final ImagePicker picker = ImagePicker();

  Future<void> uploadIdProof() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      return;
    }

    setState(() {
      uploadedIdProofPath = image.path;
      selectedId = image.name;
    });
  }

  void continueToRoleSelection() {
    if (selectedId == 'No ID proof selected') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your ID proof'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RoleSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identity Verification'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.verified_user,
                size: 90,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Verify Your Identity',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Your ID proof will be kept secure. '
              'It will only be temporarily displayed when required '
              'for an accepted job.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 35),

            const Text(
              'Select ID Proof',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID Proof Type',
              ),

              items: const [
                DropdownMenuItem(
                  value: 'Government ID',
                  child: Text('Government ID'),
                ),
                DropdownMenuItem(
                  value: 'Other ID',
                  child: Text('Other ID'),
                ),
              ],

              onChanged: (value) {
                // We will store this later.
              },
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                children: [

                  const Icon(
                    Icons.upload_file,
                    size: 55,
                  ),

                  const SizedBox(height: 10),

                  Text(selectedId),

                  const SizedBox(height: 15),

                  ElevatedButton.icon(
                    onPressed: uploadIdProof,

                    icon: const Icon(Icons.upload),

                    label: const Text(
                      'Select ID Proof',
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: continueToRoleSelection,

                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Role'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              'How do you want to use the app?',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 120,

              child: Card(
                child: InkWell(
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const UserHomeScreen(),
    ),
  );
},

                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.person,
                        size: 45,
                      ),

                      SizedBox(height: 10),

                      Text(
                        'USER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'I need a worker',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 120,

              child: Card(
                child: InkWell(
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LabourHomeScreen(),
    ),
  );
},

                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.engineering,
                        size: 45,
                      ),

                      SizedBox(height: 10),

                      Text(
                        'LABOUR',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'I am looking for work',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Labour Connect'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Find the right worker for your job.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 100,

              child: Card(
                child: InkWell(
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const FindLabourScreen(),
    ),
  );
},

                  child: const Row(
                    children: [

                      SizedBox(width: 20),

                      Icon(
                        Icons.search,
                        size: 45,
                      ),

                      SizedBox(width: 20),

                      Text(
                        'Find Labour',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 100,

  child: Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ApplicantsScreen(),
          ),
        );
      },

      child: const Row(
        children: [

          SizedBox(width: 20),

          Icon(
            Icons.people,
            size: 45,
          ),

          SizedBox(width: 20),

          Text(
            'View Applicants',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 100,

              child: Card(
                child: InkWell(
                  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PostJobScreen(),
    ),
  );
},

                  child: const Row(
                    children: [

                      SizedBox(width: 20),

                      Icon(
                        Icons.add_circle,
                        size: 45,
                      ),

                      SizedBox(width: 20),

                      Text(
                        'Post a Job',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 100,

  child: Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const WorkStatusScreen(),
          ),
        );
      },

      child: const Row(
        children: [

          SizedBox(width: 20),

          Icon(
            Icons.work_history,
            size: 45,
          ),

          SizedBox(width: 20),

          Text(
            'Work Status',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
  
}
class WorkStatusScreen extends StatefulWidget {
  const WorkStatusScreen({super.key});

  @override
  State<WorkStatusScreen> createState() =>
      _WorkStatusScreenState();
}

class _WorkStatusScreenState
    extends State<WorkStatusScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Status'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              'Current Work',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Worker Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [

                        const Icon(
                          Icons.work,
                          size: 35,
                        ),

                        const SizedBox(width: 15),

                        Text(
                          workStatus,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    if (workStatus ==
                        'Not Started')
                      const Text(
                        'Waiting for the worker to start the work.',
                      ),

                    if (workStatus ==
                        'Work Started')
                      const Text(
                        'The worker has started the work.',
                      ),

                    if (workStatus == 'Work Completed')
  Column(
    children: [

      const Text(
        'The worker has completed the work.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 20),

      SizedBox(
        width: double.infinity,
        height: 50,

        child: ElevatedButton(
          onPressed: () {
            generatedOtp = '123456';
            otpGenerated = true;

            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(
                content: Text(
                  'OTP generated successfully!',
                ),
              ),
            );

            setState(() {});
          },

          child: const Text(
            'CONFIRM WORK',
          ),
        ),
      ),

      if (otpGenerated) ...[

        const SizedBox(height: 15),

        const Text(
          'Give this OTP to the worker:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          generatedOtp,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
      ],
    ],
  ),
  if (workStatus == 'Work Confirmed')
  const Column(
    children: [

      SizedBox(height: 20),

      Icon(
        Icons.check_circle,
        size: 70,
      ),

      SizedBox(height: 15),

      Text(
        'Work Completed Successfully!',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(height: 10),

      Text(
        'The work has been confirmed successfully.',
        textAlign: TextAlign.center,
      ),
    ],
  ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindLabourScreen extends StatefulWidget {
  const FindLabourScreen({super.key});

  @override
  State<FindLabourScreen> createState() =>
      _FindLabourScreenState();
}

class _FindLabourScreenState
    extends State<FindLabourScreen> {

  final TextEditingController searchController =
      TextEditingController();

  String selectedWork = 'All';
  String selectedLocation = 'All';
  String selectedAvailability = 'All';

  final List<Map<String, String>> labourList = [
    {
      'name': 'Ravi',
      'skill': 'Plumbing',
      'location': 'Karaikudi',
      'availability': 'Available',
    },
    {
      'name': 'Kumar',
      'skill': 'Electrical',
      'location': 'Devakottai',
      'availability': 'Available',
    },
    {
      'name': 'Arun',
      'skill': 'Painting',
      'location': 'Karaikudi',
      'availability': 'Busy',
    },
    {
      'name': 'Suresh',
      'skill': 'Construction',
      'location': 'Karaikudi',
      'availability': 'Available',
    },
  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredLabours =
        labourList.where((labour) {

      final search =
          searchController.text.toLowerCase();

      final matchesSearch =
          labour['name']!
                  .toLowerCase()
                  .contains(search) ||
              labour['skill']!
                  .toLowerCase()
                  .contains(search);

      final matchesWork =
          selectedWork == 'All' ||
          labour['skill'] == selectedWork;

      final matchesLocation =
          selectedLocation == 'All' ||
          labour['location'] == selectedLocation;

      final matchesAvailability =
          selectedAvailability == 'All' ||
          labour['availability'] ==
              selectedAvailability;

      return matchesSearch &&
          matchesWork &&
          matchesLocation &&
          matchesAvailability;

    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Labour'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            TextField(
              controller: searchController,

              onChanged: (value) {
                setState(() {});
              },

              decoration: InputDecoration(
                labelText: 'Search by name or skill',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedWork,

              decoration: const InputDecoration(
                labelText: 'Work Type',
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'Plumbing',
                  child: Text('Plumbing'),
                ),
                DropdownMenuItem(
                  value: 'Electrical',
                  child: Text('Electrical'),
                ),
                DropdownMenuItem(
                  value: 'Painting',
                  child: Text('Painting'),
                ),
                DropdownMenuItem(
                  value: 'Construction',
                  child: Text('Construction'),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedWork =
                      value ?? 'All';
                });
              },
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child:
                      DropdownButtonFormField<String>(
                    value: selectedLocation,

                    decoration:
                        const InputDecoration(
                      labelText: 'Location',
                      border:
                          OutlineInputBorder(),
                    ),

                    items: const [
                      DropdownMenuItem(
                        value: 'All',
                        child: Text('All'),
                      ),
                      DropdownMenuItem(
                        value: 'Karaikudi',
                        child: Text('Karaikudi'),
                      ),
                      DropdownMenuItem(
                        value: 'Devakottai',
                        child: Text('Devakottai'),
                      ),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedLocation =
                            value ?? 'All';
                      });
                    },
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child:
                      DropdownButtonFormField<String>(
                    value:
                        selectedAvailability,

                    decoration:
                        const InputDecoration(
                      labelText: 'Availability',
                      border:
                          OutlineInputBorder(),
                    ),

                    items: const [
                      DropdownMenuItem(
                        value: 'All',
                        child: Text('All'),
                      ),
                      DropdownMenuItem(
                        value: 'Available',
                        child: Text('Available'),
                      ),
                      DropdownMenuItem(
                        value: 'Busy',
                        child: Text('Busy'),
                      ),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedAvailability =
                            value ?? 'All';
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredLabours.isEmpty
                  ? const Center(
                      child: Text(
                        'No suitable labour found.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount:
                          filteredLabours.length,

                      itemBuilder:
                          (context, index) {

                        final labour =
                            filteredLabours[index];

                        return Card(
                          margin:
                              const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child: Padding(
                            padding:
                                const EdgeInsets.all(
                                    15),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                Row(
                                  children: [

                                    const CircleAvatar(
                                      radius: 25,
                                      child: Icon(
                                        Icons.person,
                                      ),
                                    ),

                                    const SizedBox(
                                        width: 12),

                                    Text(
                                      labour['name']!,
                                      style:
                                          const TextStyle(
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                    height: 12),

                                Text(
                                  'Skill: '
                                  '${labour['skill']}',
                                ),

                                Text(
                                  'Location: '
                                  '${labour['location']}',
                                ),

                                Text(
                                  'Status: '
                                  '${labour['availability']}',
                                ),

                                const SizedBox(
                                    height: 12),

                                SizedBox(
                                  width:
                                      double.infinity,

                                  child:
                                      ElevatedButton(
                                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LabourProfileScreen(
        labour: labour,
      ),
    ),
  );
},

                                    child:
                                        const Text(
                                      'VIEW PROFILE',
                                    ),
                                  ),
                                ),
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
    );
  }
}
class LabourProfileScreen extends StatelessWidget {
  final Map<String, String> labour;

  const LabourProfileScreen({
    super.key,
    required this.labour,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labour Profile'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              labour['name']!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  children: [

                    _detailRow(
                      Icons.work,
                      'Skill',
                      labour['skill']!,
                    ),

                    const Divider(),

                    _detailRow(
                      Icons.location_on,
                      'Location',
                      labour['location']!,
                    ),

                    const Divider(),

                    _detailRow(
                      Icons.access_time,
                      'Availability',
                      labour['availability']!,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Identity verification',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'ID proof will only be displayed '
              'after the worker is selected for a job.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                onPressed: () {

  workerRequests.add({
    'name': labour['name']!,
    'skill': labour['skill']!,
    'location': labour['location']!,
    'availability': labour['availability']!,
    'status': 'Pending',
  });

  ScaffoldMessenger.of(context)
      .showSnackBar(
    const SnackBar(
      content: Text(
        'Worker request sent successfully!',
      ),
    ),
  );

},

                child: const Text(
                  'REQUEST THIS WORKER',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [

        Icon(icon, size: 28),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  String selectedWork = 'Select work type';

  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  final TextEditingController workersController =
      TextEditingController();

  final TextEditingController locationController =
      TextEditingController();

  final TextEditingController dateController =
      TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    workersController.dispose();
    locationController.dispose();
    dateController.dispose();

    super.dispose();
  }

  void postJob() {
    if (selectedWork == 'Select work type' ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        workersController.text.isEmpty ||
        locationController.text.isEmpty ||
        dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details'),
        ),
      );

      return;
    }

    final job = {
      'workType': selectedWork,
      'title': titleController.text,
      'description': descriptionController.text,
      'workers': workersController.text,
      'location': locationController.text,
      'date': dateController.text,
    };
    postedJobs.add(job);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyPostedJobsScreen(
          job: job,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post a Job'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Create a Job',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tell workers what kind of help you need.',
            ),

            const SizedBox(height: 25),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Work Type',
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(
                  value: 'Construction',
                  child: Text('Construction'),
                ),
                DropdownMenuItem(
                  value: 'Plumbing',
                  child: Text('Plumbing'),
                ),
                DropdownMenuItem(
                  value: 'Electrical',
                  child: Text('Electrical'),
                ),
                DropdownMenuItem(
                  value: 'Painting',
                  child: Text('Painting'),
                ),
                DropdownMenuItem(
                  value: 'Cleaning',
                  child: Text('Cleaning'),
                ),
                DropdownMenuItem(
                  value: 'Gardening',
                  child: Text('Gardening'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedWork =
                      value ?? 'Select work type';
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Job Title',
                hintText: 'Example: Need a plumber',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Job Description',
                hintText: 'Describe the work required',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: workersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Workers',
                hintText: 'Example: 2',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Work Location',
                hintText: 'Example: Karaikudi',
                prefixIcon: const Icon(
                  Icons.location_on,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: dateController,
              readOnly: true,

              onTap: () async {
                DateTime? pickedDate =
                    await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  setState(() {
                    dateController.text =
                        '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                  });
                }
              },

              decoration: InputDecoration(
                labelText: 'Expected Work Date',
                hintText: 'Select date',
                prefixIcon: const Icon(
                  Icons.calendar_today,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                onPressed: postJob,

                child: const Text(
                  'POST JOB',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LabourHomeScreen extends StatelessWidget {
  const LabourHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labour Connect'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Welcome, Labour!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Find suitable jobs near you.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 100,

              child: Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AvailableJobsScreen(),
                      ),
                    );
                  },

                  child: const Row(
                    children: [

                      SizedBox(width: 20),

                      Icon(
                        Icons.work,
                        size: 45,
                      ),

                      SizedBox(width: 20),

                      Text(
                        'Available Jobs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            
SizedBox(
  width: double.infinity,
  height: 100,

  child: Card(
    child: InkWell(
      onTap: () {
        print('My Applications clicked');
      },

      child: const Row(
        children: [

          SizedBox(width: 20),

          Icon(
            Icons.assignment,
            size: 45,
          ),

          SizedBox(width: 20),

          Text(
            'My Applications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),

// 👇 ADD THE NEW CODE HERE

const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 100,

  child: Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const WorkerRequestsScreen(),
          ),
        );
      },
      

      child: const Row(
        children: [

          SizedBox(width: 20),

          Icon(
            Icons.person_add,
            size: 45,
          ),

          SizedBox(width: 20),

          Text(
            'Worker Requests',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),
const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 100,

  child: Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const LabourWorkScreen(),
          ),
        );
      },

      child: const Row(
        children: [

          SizedBox(width: 20),

          Icon(
            Icons.construction,
            size: 45,
          ),

          SizedBox(width: 20),

          Text(
            'My Current Work',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
class LabourWorkScreen extends StatefulWidget {
  const LabourWorkScreen({super.key});

  @override
  State<LabourWorkScreen> createState() =>
      _LabourWorkScreenState();
}

class _LabourWorkScreenState
    extends State<LabourWorkScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Current Work'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              'Work Status',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Current Job',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Status: $workStatus',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 25),

                    if (workStatus ==
                        'Worker Accepted')
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              workStatus =
                                  'Work Started';
                            });
                          },

                          child: const Text(
                            'START WORK',
                          ),
                        ),
                      ),

                    if (workStatus ==
                        'Work Started')
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              workStatus =
                                  'Work Completed';
                            });
                          },

                          child: const Text(
                            'WORK COMPLETED',
                          ),
                        ),
                      ),

                    if (workStatus == 'Work Completed')
  Column(
    children: [

      const Text(
        'Work completed. Waiting for user confirmation.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 20),

      SizedBox(
        width: double.infinity,
        height: 50,

        child: ElevatedButton(
          onPressed: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const WorkCompletionOtpScreen(),
    ),
  );

  if (result == true) {
    setState(() {
      workStatus = 'Work Confirmed';
    });
  }
},

          child: const Text(
            'ENTER COMPLETION OTP',
          ),
        ),
      ),
    ],
  ),
  if (workStatus == 'Work Confirmed')
  Column(
    children: [

      const SizedBox(height: 20),

      const Icon(
        Icons.check_circle,
        size: 70,
      ),

      const SizedBox(height: 15),

      const Text(
        'Work Completed Successfully!',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 10),

      const Text(
        'The work has been confirmed successfully.',
        textAlign: TextAlign.center,
      ),

      // ADD REVIEW BUTTON HERE
      const SizedBox(height: 25),

      SizedBox(
        width: double.infinity,
        height: 50,

        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ReviewLabourScreen(),
              ),
            );
          },

          child: const Text(
            'RATE & REVIEW LABOUR',
          ),
        ),
      ),
    ],
  ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerRequestsScreen extends StatefulWidget {
  const WorkerRequestsScreen({super.key});

  @override
  State<WorkerRequestsScreen> createState() =>
      _WorkerRequestsScreenState();
}

class _WorkerRequestsScreenState
    extends State<WorkerRequestsScreen> {

  void updateRequest(
  int index,
  String status,
) {
  setState(() {
    workerRequests[index]['status'] = status;

    if (status == 'Accepted') {
      workStatus = 'Worker Accepted';
    }
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        status == 'Accepted'
            ? 'Worker request accepted!'
            : 'Worker request rejected.',
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker Requests'),
      ),

      body: workerRequests.isEmpty
          ? const Center(
              child: Text(
                'No worker requests yet.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: workerRequests.length,

              itemBuilder: (context, index) {

                final request =
                    workerRequests[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Row(
                          children: [

                            const CircleAvatar(
                              child: Icon(
                                Icons.person,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Text(
                              request['name']!,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'Skill: '
                          '${request['skill']}',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Location: '
                          '${request['location']}',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Availability: '
                          '${request['availability']}',
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Status: '
                          '${request['status']}',
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        if (request['status'] ==
                            'Pending') ...[

                          const SizedBox(height: 15),

                          Row(
                            children: [

                              Expanded(
                                child:
                                    ElevatedButton(
                                  onPressed: () {
                                    updateRequest(
                                      index,
                                      'Accepted',
                                    );
                                  },

                                  child: const Text(
                                    'ACCEPT',
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child:
                                    OutlinedButton(
                                  onPressed: () {
                                    updateRequest(
                                      index,
                                      'Rejected',
                                    );
                                  },

                                  child: const Text(
                                    'REJECT',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
class AvailableJobsScreen extends StatelessWidget {
  const AvailableJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Jobs'),
      ),

      body: postedJobs.isEmpty
          ? const Center(
              child: Text(
                'No jobs available right now.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: postedJobs.length,

              itemBuilder: (context, index) {
                final job = postedJobs[index];

                return JobCard(
                  workType: job['workType']!,
                  title: job['title']!,
                  location: job['location']!,
                  date: job['date']!,
                  workers: job['workers']!,
                  description: job['description']!,
                );
              },
            ),
    );
  }
}
class JobCard extends StatelessWidget {
  final String workType;
  final String title;
  final String description;
  final String location;
  final String date;
  final String workers;

  const JobCard({
    super.key,
    required this.workType,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.workers,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              workType,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 5),
                Text(location),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 5),
                Text(date),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(width: 5),
                Text('$workers Worker(s)'),
              ],
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
  applications.add({
    'jobTitle': title,
    'workType': workType,
    'location': location,
    'date': date,
    'workers': workers,
    'status': 'Pending',
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Application submitted successfully!'),
    ),
  );
},

                child: const Text(
                  'APPLY FOR JOB',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyPostedJobsScreen extends StatelessWidget {
  final Map<String, String> job;

  const MyPostedJobsScreen({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Posted Jobs'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  job['workType']!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  job['title']!,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  job['description']!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const Icon(Icons.people),
                    const SizedBox(width: 8),
                    Text(
                      '${job['workers']} Worker(s)',
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Text(job['location']!),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(job['date']!),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),

                  child: const Text(
                    'Waiting for labour applications...',
                    textAlign: TextAlign.center,
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
class ApplicantsScreen extends StatefulWidget {
  const ApplicantsScreen({super.key});

  @override
  State<ApplicantsScreen> createState() =>
      _ApplicantsScreenState();
}

class _ApplicantsScreenState
    extends State<ApplicantsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applicants'),
      ),

      body: applications.isEmpty
          ? const Center(
              child: Text(
                'No applications yet.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: applications.length,

              itemBuilder: (context, index) {
                final application =
                    applications[index];

                return Card(
                  margin: const EdgeInsets.only(
                    bottom: 15,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          'LABOUR APPLICATION',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          application['jobTitle']!,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Work: '
                          '${application['workType']}',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Location: '
                          '${application['location']}',
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Date: '
                          '${application['date']}',
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'Status: '
                          '${application['status']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ACCEPT LABOUR BUTTON
                        if (application['status'] !=
                            'Accepted')
                          SizedBox(
                            width: double.infinity,

                            child: ElevatedButton(
                       onPressed: () {

  setState(() {
    applications[index]['status'] = 'Accepted';

    // Update the labour side
    workStatus = 'Worker Accepted';
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Labour accepted successfully!',
      ),
    ),
  );
},

                              child: const Text(
                                'ACCEPT LABOUR',
                              ),
                            ),
                          ),

                        // VIEW ID PROOF BUTTON
                        if (application['status'] ==
                            'Accepted')
                          SizedBox(
                            width: double.infinity,

                            child:
                                ElevatedButton.icon(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LabourIdProofScreen(),
                                  ),
                                );

                              },

                              icon: const Icon(
                                Icons.verified_user,
                              ),

                              label: const Text(
                                'VIEW ID PROOF',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
class LabourIdProofScreen extends StatefulWidget {
  const LabourIdProofScreen({super.key});

  @override
  State<LabourIdProofScreen> createState() =>
      _LabourIdProofScreenState();
}

class _LabourIdProofScreenState
    extends State<LabourIdProofScreen> {

  bool workCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Labour ID Verification',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.verified_user,
              size: 70,
            ),

            const SizedBox(height: 15),

            const Text(
              'Identity Verification',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Verify the labour identity document '
              'before confirming the work.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            Expanded(
              child: uploadedIdProofPath == null
                  ? const Center(
                      child: Text(
                        'No ID proof available.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  : InteractiveViewer(
                      child: Image.file(
                        File(
                          uploadedIdProofPath!,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
            ),

            const SizedBox(height: 15),

            if (!workCompleted)
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton.icon(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const WorkCompletionOtpScreen(),
                      ),
                    ).then((completed)async {

                     if (completed == true) {
  try {
    if (uploadedIdProofPath != null) {
      final file = File(uploadedIdProofPath!);

      if (await file.exists()) {
        await file.delete();
      }
    }

    setState(() {
      workCompleted = true;
      uploadedIdProofPath = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Work completed and ID proof deleted.',
        ),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Could not delete the ID proof.',
        ),
      ),
    );
  }
}

                    });
                  },

                  icon: const Icon(
                    Icons.check_circle,
                  ),

                  label: const Text(
                    'WORK COMPLETED',
                  ),
                ),
              ),

            if (workCompleted)
              const Text(
                'WORK COMPLETED ✓',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class WorkCompletionOtpScreen extends StatefulWidget {
  const WorkCompletionOtpScreen({super.key});

  @override
  State<WorkCompletionOtpScreen> createState() =>
      _WorkCompletionOtpScreenState();
}

class _WorkCompletionOtpScreenState
    extends State<WorkCompletionOtpScreen> {

  final TextEditingController otpController =
      TextEditingController();

  final String generatedOtp = '123456';

  void verifyOtp() {
  if (otpController.text == generatedOtp) {

    setState(() {
      workStatus = 'Work Confirmed';
      workConfirmed = true;
      uploadedIdProofPath = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Work confirmed successfully!',
        ),
      ),
    );

    Navigator.pop(context, true);

  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Invalid OTP. Please try again.',
        ),
      ),
    );
  }
}
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complete Work',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.lock,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Work Completion Verification',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Enter the OTP provided for '
              'work completion.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              controller: otpController,

              keyboardType:
                  TextInputType.number,

              maxLength: 6,

              textAlign: TextAlign.center,

              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: verifyOtp,

                child: const Text(
                  'VERIFY OTP',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ReviewLabourScreen extends StatefulWidget {
  const ReviewLabourScreen({super.key});

  @override
  State<ReviewLabourScreen> createState() =>
      _ReviewLabourScreenState();
}

class _ReviewLabourScreenState
    extends State<ReviewLabourScreen> {

  int rating = 0;

  final TextEditingController reviewController =
      TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  void submitReview() {
    if (rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select a rating',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Review submitted successfully!',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate & Review'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,

          children: [

            const Icon(
              Icons.person,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Rate Your Worker',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'How was your experience?',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },

                  icon: Icon(
                    index < rating
                        ? Icons.star
                        : Icons.star_border,
                    size: 40,
                  ),
                );
              }),
            ),

            const SizedBox(height: 10),

            Text(
              rating == 0
                  ? 'Select your rating'
                  : '$rating out of 5 stars',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: reviewController,
              maxLines: 5,

              decoration: InputDecoration(
                labelText: 'Write a review (Optional)',
                hintText:
                    'Tell us about your experience...',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: submitReview,

                child: const Text(
                  'SUBMIT REVIEW',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}