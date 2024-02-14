class Urls{
  static const _baseUrl = "http://ecom-api.teamrabbil.com/api";

  static String sendOtpUrl(String email) => "$_baseUrl/UserLogin/$email";
  static String verifyOtp(String email,String otp) => "$_baseUrl/VerifyLogin/$email/$otp";
  static String readProfile = "$_baseUrl/ReadProfile";
  static String logout = "$_baseUrl/logout";
  static String completeProfile = "$_baseUrl/CreateProfile";
  static String homeBanner = "$_baseUrl/ListProductSlider";
  static String category = "$_baseUrl/CategoryList";
  static String popularProductList = "$_baseUrl/ListProductByRemark/Popular";
  static String newProductList = "$_baseUrl/ListProductByRemark/new";
  static String specialProductList = "$_baseUrl/ListProductByRemark/special";
  static String productByCategory(int categoryId) => "$_baseUrl/ListProductByCategory/$categoryId";
  static String productByBrand(int brandId) => "$_baseUrl/ListProductByCategory/$brandId";
  static String productDetails(int productId) => "$_baseUrl/ProductDetailsById/$productId";
  static String addToCartList = "$_baseUrl/CreateCartList";
  static String cartList = "$_baseUrl/CartList";
  static String brandList = "$_baseUrl/BrandList";
  static String createInvoice = "$_baseUrl/InvoiceCreate";
  static String wishList = "$_baseUrl/ProductWishList";
  static String createReview = "$_baseUrl/CreateProductReview";
  static String removeWishList(int productId) => "$_baseUrl/RemoveWishList/$productId";
  static String addToWishList(int productId) => "$_baseUrl/CreateWishList/$productId";
  static String deleteCartItem(int productId) => "$_baseUrl/DeleteCartList/$productId";
  static String reviewList(int productId) => "$_baseUrl/ListReviewByProduct/$productId";
}