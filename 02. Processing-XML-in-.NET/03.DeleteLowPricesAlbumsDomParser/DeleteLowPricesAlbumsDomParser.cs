namespace DeleteLowPricesAlbumsDomParser
{
    using System;
    using System.Xml;

    class DeleteLowPricesAlbumsDomParser
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../Catalogue.xml");
            XmlNode root = doc.DocumentElement;
            XmlNodeList prices = doc.SelectNodes("/catalog/album/price");
            XmlNode catalogue = doc.SelectSingleNode("/catalog");

            foreach (XmlNode node in prices)
            {
                if (double.Parse(node.InnerText) > 20)
                {
                    XmlNode priceParent = node.ParentNode;
                    XmlNode albumParent = priceParent.ParentNode;
                    albumParent.RemoveChild(priceParent);
                }
            }

            foreach (XmlNode node in root.ChildNodes)
            {
                foreach (XmlNode nodeChild in node.ChildNodes)
                {
                    Console.WriteLine(nodeChild.InnerText);
                }
            }
        }
    }
}