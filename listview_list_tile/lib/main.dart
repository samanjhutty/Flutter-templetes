import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('ListView ListTile'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
          ListTile(
            leading: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg'),
            title: const Text('Windows 11'),
            trailing: const Icon(Icons.delete),
            subtitle: const Text('Windows 11 custom wallpapers'),
          ),
        ],
      ),
    ),
  ));
}
