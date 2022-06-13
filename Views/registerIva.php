
<div class="container" align="center">
<label class="ok3"><h2>REGISTAR IVAS</h2></label>
<form action="index.php?r=iva/create" method="post" class="needs-validation row justify-content-center" novalidate>
        <div class="col col-6">
            <div class="mb-3">
                <label for="inputPercentagem" class="form-label ok2">Percentagem:</label>
                <input type="number" class="form-control" id="inputPercentagem" name="percentagem" min="0" step="1"required>%
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                <label for="inputDescricao" class="form-label ok2">Descrição:</label>
                <input type="text" class="form-control" id="inputDescricao" name="desc" required>
                <div class="invalid-feedback">
                    Campo obrigatório!
                </div>
            </div>
            <div class="mb-3">
                
                <input type="radio" id="vigor1" name="vigor" value=1>
                <label style="color:white"for="1">Em vigor</label><br>
                <input type="radio" id="vigor2" name="vigor" value=0>
                <label style="color:white"for="0">Não em vigor</label><br>

            </div>
            <button type="submit" class="btn btn-primary" role="button" id="coids">Registar</button>
            <a href="index.php"class="btn btn-primary" role="button" id="coids">Voltar ao menu</a>
        </div>
    </form>