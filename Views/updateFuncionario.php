<div class="container">
    <h2>Editar Funcionario</h2>
    <form action="index.php?r=user/edit&i=<?= $user->id?>" method="post" class="needs-validation row justify-content-center" novalidate>
        <input type="hidden" name="id" value="<?= $user->id?>">
        <div class="col col-6">
            <div class="mb-3">
                <label for="inputUsername" class="form-label">Username:</label>
                <input type="text" class="form-control" id="inputUsername" name="user" value="<?= $user->username?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Password:</label>
                <input type="password" class="form-control" id="inputPassword" name="pass" value="" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Email:</label>
                <input type="email" class="form-control" id="inputPassword" name="email" value="<?= $user->email?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Telefone:</label>
                <input type="number" class="form-control" id="inputPassword" name="tele" value="<?= $user->telefone?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">NIF:</label>
                <input type="number" class="form-control" id="inputPassword" name="nif" value="<?= $user->nif?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Morada:</label>
                <input type="text" class="form-control" id="inputPassword" name="morada" value="<?= $user->morada?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Localidade:</label>
                <input type="text" class="form-control" id="inputPassword" name="local" value="<?= $user->localidade?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputPassword" class="form-label">Codigo Postal:</label>
                <input type="text" class="form-control" id="inputPassword" name="cod" value="<?= $user->codigopostal?>" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Editar</button>
        </div>
    </form>
</div>

<br>
    <br>
    <a href="index.php">Voltar ao menu</a>