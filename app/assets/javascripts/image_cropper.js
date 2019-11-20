ImageCropper = function(elementId) {
  var self = this;

  self.initJcrop = function() {
    $(elementId).Jcrop({
      aspectRatio: 1,
      boxWidth: 600,
      minSize: [100, 100],
      setSelect: [0, 0, 100, 100],
      onChange: self.updateCoords,
      onSelect: self.updateCoords
    })
  }

  self.updateCoords = function(coords) {
    $('#coords-x').val(coords.x);
    $('#coords-y').val(coords.y);
    $('#coords-w').val(coords.w);
    $('#coords-h').val(coords.h);
  }
}

$(document).ready(function() {
  if ( $('#crop-image').length > 0 ) {
    cropper = new ImageCropper('#crop-image');
    cropper.initJcrop();
  }
});
