<?php
    include 'func/header.php';
?>
<!--Contenido-->
<!-- Start page content -->
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <?php echo _getProductsID($_GET["id"]) ?>
  </div>
</div>
<script>
	window.onload = function() {

	var img0 = document.getElementById('imagen0');
	var img0_ = document.getElementById('_img1');

	img0.addEventListener('change', function(e) {
		var file = img0.files[0];
		var imageType = /image.*/;

		if (file.type.match(imageType)) {
			var reader = new FileReader();

			reader.onload = function(e) {
				img0_.src = reader.result;
			}

			reader.readAsDataURL(file);	
		} else {
			img0_.innerHTML = "File not supported!";
		}
	});

	var img1 = document.getElementById('imagen1');
	var img1_ = document.getElementById('_img2');
	
	img1.addEventListener('change', function(e) {
		var file = img1.files[0];
		var imageType = /image.*/;

		if (file.type.match(imageType)) {
			var reader = new FileReader();

			reader.onload = function(e) {
				img1_.src = reader.result;
			}

			reader.readAsDataURL(file);	
		} else {
			img1_.innerHTML = "File not supported!";
		}
	});


	var img2 = document.getElementById('imagen2');
	var img2_ = document.getElementById('_img3');
	
	img2.addEventListener('change', function(e) {
		var file = img2.files[0];
		var imageType = /image.*/;

		if (file.type.match(imageType)) {
			var reader = new FileReader();

			reader.onload = function(e) {
				img2_.src = reader.result;
			}

			reader.readAsDataURL(file);	
		} else {
			img2_.innerHTML = "File not supported!";
		}
	});


	var img3 = document.getElementById('imagen3');
	var img3_ = document.getElementById('_img4');
	
	img3.addEventListener('change', function(e) {
		var file = img3.files[0];
		var imageType = /image.*/;

		if (file.type.match(imageType)) {
			var reader = new FileReader();

			reader.onload = function(e) {
				img3_.src = reader.result;
			}

			reader.readAsDataURL(file);	
		} else {
			img3_.innerHTML = "File not supported!";
		}
	});

	}

    </script>
<!--Finaliza contenido-->
<?php
    include 'func/footer.php'
?>
