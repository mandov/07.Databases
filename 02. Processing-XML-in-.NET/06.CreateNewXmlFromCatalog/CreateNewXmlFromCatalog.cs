namespace CreateNewXmlFromCatalog
{
    using System.Text;
    using System.Xml;

    class CreateNewXmlFromCatalog
    {
        static void Main()
        {
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            using (XmlReader reader = XmlReader.Create("../../../Catalogue.xml"))
            {
                using (XmlTextWriter writer = new XmlTextWriter("../../../WriteCatalogue.xml", encoding))
                {
                    writer.Formatting = Formatting.Indented;
                    writer.IndentChar = '\t';
                    writer.Indentation = 1;

                    writer.WriteStartDocument();
                    writer.WriteStartElement("albums");
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "name")
                        {
                            writer.WriteStartElement("album");
                            writer.WriteElementString("name", reader.ReadInnerXml());

                        }

                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "artist")
                        {
                            writer.WriteElementString("artist", reader.ReadInnerXml());
                            writer.WriteEndElement();
                        }

                    }

                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                }
            }
        }
    }
}