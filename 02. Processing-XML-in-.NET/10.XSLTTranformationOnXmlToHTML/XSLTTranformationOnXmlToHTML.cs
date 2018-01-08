namespace XSLTTranformationOnXmlToHTML
{
    using System.Xml.Xsl;

    class XSLTTranformationOnXmlToHTML
    {
        static void Main()
        {
            XslCompiledTransform xslTransform = new XslCompiledTransform();
            xslTransform.Load("../../../CatalogueStyleSheet.xslt");
            xslTransform.Transform("../../../Catalogue.xml", "../../../HTMLCatalogue.html");
        }
    }
}