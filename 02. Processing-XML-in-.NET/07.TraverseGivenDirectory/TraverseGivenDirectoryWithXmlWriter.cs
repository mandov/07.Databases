namespace TraverseDirectoryContentToXML
{
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Xml;

    public class TraverseDirectoryContent
    {
        public static void Main()
        {
            string directory = @"C:\Users\Gabriel\Desktop\Coding\Telerik\07.Databases\02.Processing-XML-in-.NET\02. Processing-XML-in-.NET\08.TraverseGivenDirectoryWithXDocum";
            string fileName = "../../directoryInfo.xml";
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            var rootDirectory = new DirectoryInfo(directory);

            using (XmlTextWriter writer = new XmlTextWriter(fileName, encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("root");
                TraverseDirectory(writer, rootDirectory);
                writer.WriteEndDocument();
            }
        }

        private static void TraverseDirectory(XmlTextWriter writer, DirectoryInfo directory)
        {
            foreach (var dir in directory.GetDirectories())
            {
                writer.WriteStartElement("dir");
                writer.WriteAttributeString("path", dir.Name);
                TraverseDirectory(writer, dir);
            }

            foreach (var file in directory.GetFiles())
            {
                writer.WriteStartElement("file");
                writer.WriteAttributeString("name", file.Name);
                writer.WriteEndElement();

            }

            writer.WriteEndElement();
        }
    }
}