namespace ExtractPricesFromCatalog
{
    using System;
    using System.Linq;
    using System.Xml;
    using System.Xml.Linq;

    class ExtractPricesFromCatalog
    {
        static void Main()
        {
            //Extract elements with xPath expression
            Console.WriteLine("Extract elements with xPath expression:");
            XmlDocument doc = new XmlDocument();
            string filename = "../../../Catalogue.xml";
            doc.Load(filename);
            string xPathExpression = "/catalog/album[year >= 2013]/price";
            XmlNodeList priceOfalbumsWhichAreNotMoreThaFiveYearsOld = doc.SelectNodes(xPathExpression);
            foreach (XmlNode price in priceOfalbumsWhichAreNotMoreThaFiveYearsOld)
            {
                Console.WriteLine($"Album name: {price.ParentNode.FirstChild.InnerText} \nAlbum Price: {price.InnerText}");
            }


            //Extract elements with Linq Query
            Console.WriteLine("\nExtract elements with Linq Query:");
            XDocument linqDoc = XDocument.Load(filename);
            var albumsWhichAreNotMoreThanFiveYearsOld = from year in linqDoc.Descendants("album")
                                                        where int.Parse(year.Element("year").Value) > 2013
                                                        select new
                                                        {
                                                            Price = year.Element("price").Value,
                                                            AlbumName = year.Element("name").Value
                                                        };

            foreach (var album in albumsWhichAreNotMoreThanFiveYearsOld)
            {
                Console.WriteLine($"Album name:{album.AlbumName}\nAlbum price:{album.Price}");
            }
        }
    }
}