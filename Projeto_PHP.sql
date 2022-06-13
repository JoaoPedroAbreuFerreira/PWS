CREATE database if NOT EXISTS projeto_php;
USE projeto_php;

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id` int(10) UNSIGNED NOT NULL,
  `designacaoSocial` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` int(9) NOT NULL,
  `nif` int(9) UNSIGNED NOT NULL,
  `morada` varchar(45) NOT NULL,
  `codigoPostal` varchar(45) NOT NULL,
  `localidade` varchar(45) NOT NULL,
  `capitalSocial` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura`
--

CREATE TABLE `fatura` (
  `id` int(10) UNSIGNED NOT NULL,
  `Utilizador_id` int(10) UNSIGNED NOT NULL,
  `Cliente_id` int(10) UNSIGNED NOT NULL,
  `dataFatura` datetime NOT NULL DEFAULT current_timestamp(),
  `valorTotal` decimal(10,2) UNSIGNED NOT NULL,
  `ivaTotal` decimal(10,2) UNSIGNED NOT NULL,
  `estado` enum('Emitida','Em Lancamento') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `iva`
--

CREATE TABLE `iva` (
  `id` int(10) UNSIGNED NOT NULL,
  `percentagem` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `vigor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `linhafatura`
--

CREATE TABLE `linhafatura` (
  `id` int(10) UNSIGNED NOT NULL,
  `Fatura_id` int(10) UNSIGNED NOT NULL,
  `Produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(10) UNSIGNED NOT NULL,
  `valor` decimal(10,2) UNSIGNED NOT NULL,
  `valorIva` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(10) UNSIGNED NOT NULL,
  `Iva_id` int(10) UNSIGNED NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `preco` decimal(10,2) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` int(10) UNSIGNED NOT NULL,
  `nif` int(10) NOT NULL,
  `morada` varchar(45) NOT NULL,
  `codigoPostal` varchar(45) NOT NULL,
  `role` enum('funcionario','cliente','administrador') NOT NULL,
  `localidade` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabela `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id`,`Utilizador_id`,`Cliente_id`),
  ADD KEY `Fatura_FKIndex1` (`Utilizador_id`),
  ADD KEY `Fatura_FKIndex2` (`Cliente_id`);

--
-- Índices para tabela `iva`
--
ALTER TABLE `iva`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `linhafatura`
--
ALTER TABLE `linhafatura`
  ADD PRIMARY KEY (`id`,`Fatura_id`,`Produto_id`),
  ADD KEY `LinhaFatura_FKIndex1` (`Fatura_id`),
  ADD KEY `LinhaFatura_FKIndex2` (`Produto_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`,`Iva_id`),
  ADD UNIQUE KEY `referencia_UNIQUE` (`referencia`),
  ADD KEY `Produto_FKIndex1` (`Iva_id`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `nif_UNIQUE` (`nif`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `iva`
--
ALTER TABLE `iva`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `linhafatura`
--
ALTER TABLE `linhafatura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Limitadores para a tabela `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`Utilizador_id`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fatura_ibfk_2` FOREIGN KEY (`Cliente_id`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `linhafatura`
--
ALTER TABLE `linhafatura`
  ADD CONSTRAINT `linhafatura_ibfk_1` FOREIGN KEY (`Fatura_id`) REFERENCES `fatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `linhafatura_ibfk_2` FOREIGN KEY (`Produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`Iva_id`) REFERENCES `iva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


-- DADOS TESTE 
-- ADMIN PASS = admin
INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(1, 'admin', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', 'admin@gmail.com', '980123567', '213056483', 'Largo Jose lucio', '2400-823', 'administrador', 'Leiria');

-- Funcionarios PASS = funcionario
INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(2, 'joao', '24D96A103E8552CB162117E5B94B1EAD596B9C0A94F73BC47F7D244D279CACF2', 'joao@gmail.com', '920450634', '213356342', 'Largo da Fonte', '3780-566', 'funcionario', 'Anadia');

INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(3, 'rodrigo', '24D96A103E8552CB162117E5B94B1EAD596B9C0A94F73BC47F7D244D279CACF2', 'rodrigo@gmail.com', '945056456', '219986456', 'Rua do agueiro', '2480-057', 'funcionario', 'Leiria');

-- Clientes PASS = cliente
INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(4, 'marco', 'A60B85D409A01D46023F90741E01B79543A3CB1BA048EAEFBE5D7A63638043BF', 'marco@gmail.com', '946023123', '21007693', 'Rua de cabo verde', '2430-399', 'cliente', 'Marinha Grande');

INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(5, 'fernando', 'A60B85D409A01D46023F90741E01B79543A3CB1BA048EAEFBE5D7A63638043BF', 'fernando@gmail.com', '994324567', '219455434', 'Travessa Manuel Leal', '2400-711', 'cliente', 'Leiria');

INSERT INTO `utilizador` (`id`, `username`, `pass`, `email`, `telefone`, `nif`, `morada`, `codigoPostal`, `role`, `localidade`) VALUES
(6, 'eduardo', 'A60B85D409A01D46023F90741E01B79543A3CB1BA048EAEFBE5D7A63638043BF', 'eduardo@gmail.com', '912999666', '219678968', 'Avenida Columbano Bordalo Pinheiro', '1500-173', 'cliente', 'Lisboa');
