namespace CreateXmlDocumentFromTxt
{
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Xml.Linq;

    class CreateXmlDocumentFromTxt
    {
        static void Main(string[] args)
        {
            string textFromFile = "";
            using (StreamReader reader = new StreamReader("../../../person.txt"))
            {
                textFromFile = reader.ReadToEnd();
            }

            List<string> elements = textFromFile.Split('|').ToList();
            XDocument xmlDocument = new XDocument(new XElement("persons",
                new XElement("person",
                new XElement("name", elements[0]),
                new XElement("address", elements[1]),
                new XElement("phone", elements[2])),
                new XElement("person",
                new XElement("name", elements[3]),
                new XElement("address", elements[4]),
                new XElement("phone", elements[5])),
                new XElement("person",
                new XElement("name", elements[6]),
                new XElement("address", elements[7]),
                new XElement("phone", elements[8]))));

            xmlDocument.Save("../../../PersonsInXml.xml", SaveOptions.None);
        }
    }
}