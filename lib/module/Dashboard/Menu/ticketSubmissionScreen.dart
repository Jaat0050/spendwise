import 'package:flutter/material.dart';

class TicketSubmissionScreen extends StatefulWidget {
  const TicketSubmissionScreen({super.key});

  @override
  State<TicketSubmissionScreen> createState() => _TicketSubmissionScreenState();
}

class _TicketSubmissionScreenState extends State<TicketSubmissionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitTicket() {
    if (_formKey.currentState!.validate()) {
      // Here, implement your logic to send the ticket data to your backend.
      // For example, call an API endpoint with _subjectController.text and _descriptionController.text.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ticket Submitted!')),
      );
      Navigator.pop(context); // Optionally navigate back after submission.
    }
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Submit a Ticket")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: "Subject",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter a subject" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) => value == null || value.isEmpty
                    ? "Enter a description"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTicket,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text("Submit Ticket"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
