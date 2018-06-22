<?php
    include 'func/header.php'
?>
<!--Contenido-->
<!-- Start page content -->
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <form id="contact-form" action="mail.php" method="post">
          <div class="row">
              <div class="col-md-12">
                  <div class="section-title text-uppercase mb-40">
                      <h4>Dynamic Contact</h4>
                  </div>
              </div>
              <div class="col-md-6">
                  <input type="text" name="name" placeholder="Your name here">
              </div>
              <div class="col-md-6">
                  <input type="email" name="email" placeholder="Your email here">
              </div>
              <div class="col-md-6">
                  <input type="text" name="subject" placeholder="Subject here">
              </div>
              <div class="col-md-6">
                <div class="show-label text-center">
                  <select>
                      <option selected="selected" value="position">9</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                  </select>
                </div>
              </div>
              <div class="col-md-12">
                  <textarea placeholder="Message" name="message" class="custom-textarea"></textarea>
                  <button class="submit-btn mt-20" type="submit">submit message</button>
              </div>
          </div>
      </form>
  </div>
</div>
<!--Finaliza contenido-->
<?php
    include 'func/footer.php'
?>
