from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class shop():

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")


    @keyword
    def hello_world(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productslist):
        i = 1
        productstitles = self.selLib.get_webelements("css:.card-title")
        for productsTitle in productstitles:
            if productsTitle.text in productslist:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
        i = i + 1

