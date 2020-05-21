package crudclient.store;

import com.google.gson.Gson;
import crudclient.listagem.DadosProdutosList;
import crudclient.listagem.Listagem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "/store", urlPatterns = "/store")
public class Store extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pesquisa = "";
        String id_categoria = "";
        String id_fabricante = "";
        String precomax = "";
        String precomin = "";
        String preco ="";

        pesquisa = request.getParameter("pesquisa");
        precomin = request.getParameter("precomin");
        precomax = request.getParameter("precomax");

        if(request.getParameter("categoria")!=null && !request.getParameter("categoria").equals("0")){
            id_categoria = " AND p.id_categoria = "+request.getParameter("categoria");
        }

        if(!request.getParameter("fabricante").isEmpty() && !request.getParameter("fabricante").equals("0")){
            id_fabricante = " AND p.id_fabricante = "+request.getParameter("fabricante");
        }

        if(!request.getParameter("precomin").isEmpty() && !request.getParameter("precomax").isEmpty()){
            preco = " AND p.preco BETWEEN "+precomin+" AND "+precomax;
        }

        System.out.println("****************************************"+id_categoria);
        System.out.println("****************************************"+request.getParameter("fabricante"));
        System.out.println("****************************************"+preco);

        Listagem lt = new Listagem();
        List<DadosProdutosList> pesqlistproduto = new ArrayList<DadosProdutosList>();
        pesqlistproduto = lt.readdadosprodutoslist("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
                "p.preco, c.categoria, f.fabricante FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
                "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante WHERE produto " +
                "LIKE '%"+pesquisa+"%'"+id_categoria+id_fabricante+preco+";");

        String json = new Gson().toJson(pesqlistproduto);
        System.out.println(json); //ver o que ta passando pra pegar o objeto retornado na view
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
