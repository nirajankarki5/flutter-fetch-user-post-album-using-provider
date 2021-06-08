import '../providers/album_provider.dart';
import '../widgets/album_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersAlbum extends StatefulWidget {
  int id;
  UsersAlbum(this.id);

  @override
  _UsersAlbumState createState() => _UsersAlbumState();
}

class _UsersAlbumState extends State<UsersAlbum> {
  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // like initstate but runs multiple times
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AlbumProvider>(context).fetchAlbum(widget.id).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final album = Provider.of<AlbumProvider>(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: album.albumList.length,
              itemBuilder: (context, int index) {
                return AlbumContainer(album.albumList[index]);
              },
            ),
          );
  }
}
