<?php echo form_open('login/ingresa'); ?>
<div class="form-group col-md-12">
  <label class="control-label">Email*:</label>
  <input type="email" name="correo" id="correo" class="form-control" required />
</div>
<div class="form-group col-md-12">
  <label class="control-label">Contraseña:</label>
  <input type="password" name="passwd" class="form-control" />
</div>
<div class="form-group col-md-12">
  <label class="control-label">Repetir Contraseña:</label>
  <input type="password" name="passwd1" class="form-control" />
</div>
  <button type="submit" class="btn btn-primary">Enviar</button>
<?php echo form_close(); ?>
