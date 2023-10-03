/// @description Flickering

if image_xscale <= _MINSCALE
	_squash = false;
else if image_xscale >= _MAXSCALE
	_squash = true;
	
if _squash {
	image_xscale -= _SQUASHRATE;
	image_yscale -= _SQUASHRATE;
} else {
	image_xscale += _SQUASHRATE;
	image_yscale += _SQUASHRATE;
}