namespace JSON.Net
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Net;
    using System.Linq;
    using System.Xml.Linq;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;

    class JSONNet
    {
        public const string URL = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";

        static void Main()
        {
            XDocument doc = XDocument.Load(URL);
            string jsonFormat = ConvertXmlToJson(doc);
            PrintAllTitlesWithUsingLinqQuery(jsonFormat);
            var videos = ParseJsonToPOCO(jsonFormat);
            HTMLGenerator html = new HTMLGenerator();
            html.CreateHTMlFromPoco(videos);
            File.WriteAllText("../../Videos.html", html.ToString(), System.Text.Encoding.UTF8);
        }

        public static string DownloadXml(string url)
        {
            var webClient = new WebClient();
            var xml = webClient.DownloadData(url);
            return xml.ToString();
        }

        public static string ConvertXmlToJson(XDocument xml)
        {
            XDocument xmlDocument = XDocument.Load(URL);
            var jsonFormat = JsonConvert.SerializeXNode(xmlDocument, Formatting.Indented);
            return jsonFormat;
        }

        public static void PrintAllTitlesWithUsingLinqQuery(string json)
        {
            var jObject = JObject.Parse(json);
            var videoTitles = jObject["feed"]["entry"].Select(v => v["title"]);
            foreach (var title in videoTitles)
            {
                Console.WriteLine(title);
            }
        }

        public static IEnumerable<IVideo> ParseJsonToPOCO(string jsonFile)
        {
            var jObject = JObject.Parse(jsonFile);
            return jObject["feed"]["entry"].Select(v => JsonConvert.DeserializeObject<Video>(v.ToString()));
        }
    }
}