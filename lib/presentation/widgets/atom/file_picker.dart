import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class FilePathPicker extends StatefulWidget {
  final void Function(String d) path;
  const FilePathPicker({super.key, required this.path});

  @override
  State<FilePathPicker> createState() => _FilePathPickerState();
}

class _FilePathPickerState extends State<FilePathPicker> {
  String? _selectedFilePath;
  String? _errorMessage;

  Future<void> _pickFile() async {
    if (await _requestPermission(Permission.photos)) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        final file = result.files.single;
        final fileSizeInMB = file.size / (1024 * 1024);
        if (fileSizeInMB > 2) {
          setState(() {
            _selectedFilePath = null;
            _errorMessage = 'File size should not exceed 2 MB';
          });
        } else {
          setState(() {
            _selectedFilePath = file.path;
            _errorMessage = null;
          });
          widget.path(_selectedFilePath!);
        }
      } else {
        setState(() {
          _selectedFilePath = null;
          _errorMessage = null;
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Storage permission denied';
      });
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }

  Icon _getFileIcon(String? filePath) {
    if (filePath == null) return const Icon(Icons.insert_drive_file);

    final extension = path.extension(filePath).toLowerCase();
    switch (extension) {
      case '.jpg':
      case '.jpeg':
      case '.png':
        return const Icon(Icons.image);
      default:
        return const Icon(Icons.insert_drive_file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pilih File Gambar'),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: _pickFile,
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              if (_selectedFilePath != null) ...[
                _getFileIcon(_selectedFilePath),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    path.basename(_selectedFilePath!),
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (_selectedFilePath == null)
                const Text(
                  'No Image selected',
                  style: TextStyle(fontSize: 16),
                ),
            ],
          ),
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 10),
          Text(
            _errorMessage!,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ],
    );
  }
}
