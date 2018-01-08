namespace ExtractAllSongNamesWithXMLReader
{
    using System;
    using System.Linq;
    using System.Xml;
    using System.Xml.Linq;

    class ExtractAllSongNamesWithXMLReader
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Find all song names with streamReader:");
            using (XmlReader reader = XmlReader.Create("../../../Catalogue.xml"))
            {
                while (reader.Read())
                {
                    if ((reader.NodeType == XmlNodeType.Element) &&
                        reader.Name == "title")
                    {
                        reader.Read();
                        Console.WriteLine(reader.Value);
                    }
                }
            }

            Console.WriteLine("\nFind all song names with LINQ Query:");
            XDocument doc = XDocument.Load("../../../Catalogue.xml");
            var songNames = from artist in doc.Descendants("title")
                            select artist.Value;

            foreach (var songName in songNames)
            {
                Console.WriteLine(songName);
            }

        }
    }
}