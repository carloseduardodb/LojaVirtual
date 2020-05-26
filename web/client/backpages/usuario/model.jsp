<%@ page import="crudclient.cliente.ClienteDAO" %>
<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 18/05/2020
  Time: 07:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = "", email = "", cpf = "", endereco = "", numero = "", complemento = "",
            bairro = "", cidade = "", uf = "", cep = "", telefone = "", senha = "",
            senhanova = "", acao = "";

    acao = ""+request.getParameter("acao");
    nome = ""+request.getParameter("nome") + " " + request.getParameter("sobrenome");
    email = ""+request.getParameter("email");
    cpf = ""+request.getParameter("cpf");
    endereco = ""+request.getParameter("endereco");
    numero = ""+request.getParameter("numero");
    complemento = ""+request.getParameter("complemento");
    bairro = ""+request.getParameter("bairro");
    cidade = ""+request.getParameter("cidade");
    uf = ""+request.getParameter("uf");
    cep = ""+request.getParameter("cep");
    telefone = ""+request.getParameter("telefone");
    senha = ""+request.getParameter("senha");
    senhanova = ""+request.getParameter("senhanova");

    MessageDigest algorithm = MessageDigest.getInstance("SHA-256");

    byte messageDigesta[] = algorithm.digest(senha.getBytes("UTF-8"));
    byte messageDigestb[] = algorithm.digest(senhanova.getBytes("UTF-8"));

    StringBuilder hexStringa = new StringBuilder();
    StringBuilder hexStringb = new StringBuilder();
    for (byte a : messageDigesta) {
        hexStringa.append(String.format("%02X", 0xFF & a));
    }

    for (byte b : messageDigestb) {
        hexStringb.append(String.format("%02X", 0xFF & b));
    }

    senha = hexStringa.toString();
    senhanova = hexStringb.toString();

    if (acao.equals("cadastrar")) {
        Cliente cl = new Cliente(null, null, null, null, null, nome, cpf, null, endereco,
                numero, complemento, bairro, cidade, uf, cep, null, telefone, null, null,
                email, senha, null, "S");
        ClienteDAO clienteDAO = new ClienteDAO();
        clienteDAO.create(cl);

        response.sendRedirect("../../index.jsp");

    }else if(acao.equals("login")){

        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> cliente = clienteDAO.read("SELECT * FROM cliente WHERE email = '"
                +email+"' AND senha = '" + senha +"'");
        if(cliente.isEmpty()){
            response.sendRedirect("../../index.jsp?pagina=login&login=false");
        }else{
            session.setAttribute("cliente", cliente);
            response.sendRedirect("../../index.jsp?login=true");
        }

    }else if(acao.equals("atualizar")){

        ClienteDAO clienteDAO = new ClienteDAO();
        System.out.println("****************************************"+bairro);
        Cliente cl = new Cliente(Integer.parseInt(request.getParameter("idcliente")),null,
                null, null, null, null, nome, cpf, null, endereco,
                numero, complemento, bairro, cidade, uf, cep, null, telefone, null,
                null, email, null, null, "S");
        clienteDAO.update(cl);
        List<Cliente> cliente = clienteDAO.read("SELECT * FROM cliente WHERE id_cliente = "
                +request.getParameter("idcliente"));
        session.removeAttribute("cliente");
        session.setAttribute("cliente", cliente);
        response.sendRedirect("../../index.jsp?pagina=painel&paginaadmin=meusdados");

    }else if(acao.equals("alterasenha")){

        List<Cliente> dadosdocliente = session.getAttribute("cliente") != null ?
                (List<Cliente>) session.getAttribute("cliente") : null;
        if(senhanova.equals(senha)){
            response.sendRedirect("../../index.jsp?pagina=painel&paginaadmin=meusdados&senhasiguais=true");
        }else if(senha.equals(dadosdocliente.get(0).getSenha().toUpperCase()) ){
            ClienteDAO clienteDAO = new ClienteDAO();
            Cliente clt = new Cliente(dadosdocliente.get(0).getId_cliente(), senhanova);
            session.invalidate();
            response.sendRedirect("../../index.jsp?pagina=login&update="+ clienteDAO.updatesenha(clt));
        }

    }else if(acao.equals("apagar")){

        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> dadosdocliente = session.getAttribute("cliente") != null ?
                (List<Cliente>) session.getAttribute("cliente") : null;
        if(dadosdocliente!=null) {
            clienteDAO.delete(dadosdocliente.get(0).getId_cliente());
            session.invalidate();
            response.sendRedirect("../../index.jsp?pagina=login");
        }

    }else if(acao.equals("sair")){
        session.invalidate();
        response.sendRedirect("../../index.jsp?pagina=login");
    }
%>
