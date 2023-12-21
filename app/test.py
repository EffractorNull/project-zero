import unittest
import zero

class TestCase(unittest.TestCase):
    def setUp(self):
        zero.app.config["TESTING"] = True
        self.app = zero.app.test_client()
    
    def test_get_mainpage(self):
        page = self.app.post("/", data=dict(name="Vladimir Putin"))
        assert page.status_code == 200
        assert 'Hello' in str(page.data)
        assert 'Joe Biden' in str(page.data)

    def test_html_esacaping(self):
        page = self.app.post("/", data=dict(name='"><b>TEST</b><!--'))
        assert '<b>' not in str(page.data)

if __name__ == '__main__':
    unittest.main()
