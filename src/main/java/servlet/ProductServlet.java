package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OperationToCartList;
import model.OperationToMyList;
import model.Product;
import util.PathUtils;
import util.UrlUtils;

@WebServlet(name = "productServlet", urlPatterns = {UrlUtils.HOME_PAGE,
													UrlUtils.CART_PAGE,
													UrlUtils.PRODUCT_DELETE,
													UrlUtils.PRODUCT_ADD,
													UrlUtils.PRODUCT_REMOVE,
													UrlUtils.DETAIL_PAGE})
public class ProductServlet extends HttpServlet{
	private final String filePath = "C:/Users/huy/Desktop/MyWork/Cybersoft/baitapJSP/book1.csv";
	private OperationToMyList listInHomePage;
	private OperationToCartList listInCartPage;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		
		switch(path) {
		
			case UrlUtils.HOME_PAGE:{
				LinkedList<Product> productList = listInHomePage.loadDataFromDataBase();
				req.setAttribute("products", productList);
				req.getRequestDispatcher(PathUtils.HOME_PAGE).forward(req, resp);
				break;
			}
		
			case UrlUtils.CART_PAGE: {
				String productID = req.getParameter("productID");		
				Product search = listInHomePage.findProductByCode(productID);
				if(productID != null && search != null) {
					listInCartPage.addNewProduct(search);
					resp.sendRedirect(req.getContextPath() + UrlUtils.HOME_PAGE);
					break;
				}
				LinkedList<Product> productList = listInCartPage.findAllProducts();
				
				float totalBill = (float) 0;
				
				for(Product p : productList) {
					totalBill += p.getPrice()*p.getQuantity();
				}
				req.setAttribute("totalBill", totalBill);
				req.setAttribute("sizeOfProductList", productList.size());
				req.setAttribute("products", productList);
				req.getRequestDispatcher(PathUtils.CART_PAGE).forward(req, resp);
				break;
			}
			
			case UrlUtils.PRODUCT_DELETE: {
				String productIDToDelete = req.getParameter("productID");
				System.out.print(productIDToDelete);
				
				if(productIDToDelete != null) {
					listInCartPage.deleteProductByID(productIDToDelete);
				}
				resp.sendRedirect(req.getContextPath() + UrlUtils.CART_PAGE);
				break;
			}
			
			case UrlUtils.PRODUCT_ADD: {
				String productIDToAdd = req.getParameter("productID");
				if(productIDToAdd != null) {
					Product x = listInCartPage.findProductByCode(productIDToAdd);
					float newQuantity = (float) (x.getQuantity() + 1.0);
					x.setQuantity(newQuantity);
					listInCartPage.update(x);
				}
				resp.sendRedirect(req.getContextPath() + UrlUtils.CART_PAGE);
				break;
			}
			
			case UrlUtils.PRODUCT_REMOVE: {
				String productIDToAdd = req.getParameter("productID");
				if(productIDToAdd != null) {
					Product x = listInCartPage.findProductByCode(productIDToAdd);
					float newQuantity = (float) (x.getQuantity() - 1.0);
					if(newQuantity < 0) {
						newQuantity = 0;
					}
					x.setQuantity(newQuantity);
					listInCartPage.update(x);
				}
				resp.sendRedirect(req.getContextPath() + UrlUtils.CART_PAGE);
				break;
			}
			
			
			case UrlUtils.DETAIL_PAGE:{
				String productID = req.getParameter("productID");
				if(productID != null) {
					Product x = listInHomePage.findProductByCode(productID);
					req.setAttribute("product", x);
					req.getRequestDispatcher(PathUtils.DETAIL_PAGE).forward(req, resp);
				}
				break;
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch(path) {
			case UrlUtils.DETAIL_PAGE:{
				String productID = req.getParameter("productID");
				float quantity = Float.parseFloat(req.getParameter("quantity"));
				if(quantity <= 0) {
					quantity = 0;
				}
				
				if(listInHomePage.checkExistence(productID)) {
					Product product = listInHomePage.findProductByCode(productID);
					product.setQuantity(quantity);
					if(listInCartPage.checkExistence(productID)) {
						listInCartPage.update(product);
					}
					listInCartPage.addNewProduct(product);
					resp.sendRedirect(req.getContextPath() + UrlUtils.CART_PAGE);
				}
				break;
			} 
		}
	}
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		listInHomePage = new OperationToMyList(); 
		listInCartPage = new OperationToCartList();
	}
}
