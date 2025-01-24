
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class checkout():

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.colLib = BuiltIn().get_library_instance("Collections")

    @keyword
    def check_items_on_checkout_page(self, itemlist):
        actual_list = []
        products_title = self.selLib.get_webelements("xpath:(//h4[@class='media-heading'])")
        for productsTitle in products_title:
            print(productsTitle.text)
            actual_list.append(productsTitle.text)

        print(actual_list)
        self.colLib.lists_should_be_equal(actual_list,itemlist,ignore_order=True)


