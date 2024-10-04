import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data Models/data_model.dart';

class FirebaseCRUD {
  final DatabaseReference _rtValueRef =
  FirebaseDatabase.instance.ref().child("AFN_AquaSync");

  late StreamSubscription<DatabaseEvent> _databaseStream;

  // Function to initialize listeners for database changes
  void activateListeners(BuildContext context) {
    _databaseStream = _rtValueRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Parse the database data
        final databaseData = Map<dynamic, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);

        // Updating the ChangeNotifier DataModel with new data
        context.read<DataModel>().updateGroundData(
          moisture: databaseData["Moisture_Level"] ?? 0,
          temp: databaseData["Temperature"].toDouble() ?? 0.0,
          humid: databaseData["Humidity"].toDouble() ?? 0.0,
        );

        // Update irrigation status
        context.read<DataModel>().irrigationToggler(
            databaseData["Irrigating"] == 1 ? true : false);
      }
    });
  }

  // Function to stop the database listener when it's no longer needed
  void deactivateListeners() {
    _databaseStream.cancel();
  }

  // Create: Add new data to the Firebase Realtime Database
  Future<void> createFirebaseValue(String dbPath, Map<String, dynamic> data) async {
    try {
      await _rtValueRef.child(dbPath).set(data);
    } catch (e) {
      print("Error creating value: $e");
    }
  }

  // Read: Fetch data once from Firebase
  Future<DataSnapshot> readFirebaseValue(String dbPath) async {
    try {
      final snapshot = await _rtValueRef.child(dbPath).get();
      return snapshot;
    } catch (e) {
      print("Error reading value: $e");
      rethrow;
    }
  }

  // Update: Modify an existing value in the Firebase Realtime Database
  Future<void> updateFirebaseValue(String dbPath, dynamic value) async {
    try {
      await _rtValueRef.update({dbPath: value});
    } catch (e) {
      print("Error updating value: $e");
    }
  }

  // Delete: Remove a value from Firebase
  Future<void> deleteFirebaseValue(String dbPath) async {
    try {
      await _rtValueRef.child(dbPath).remove();
    } catch (e) {
      print("Error deleting value: $e");
    }
  }
}
