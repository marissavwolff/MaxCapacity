document.addEventListener('DOMContentLoaded', function() {
  const photoInput = document.getElementById('photo-input');
  const selectedPhoto = document.getElementById('selected-photo');

  photoInput.addEventListener('change', function() {
    const file = photoInput.files[0];
    if (file) {
      const reader = new FileReader();

      reader.onload = function(e) {
        selectedPhoto.src = e.target.result;
      };

      reader.readAsDataURL(file);
    } else {
      selectedPhoto.src = ''; // Clear the image if no file is selected
    }
  });
});
