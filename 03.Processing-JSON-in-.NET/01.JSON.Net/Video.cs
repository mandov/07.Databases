namespace JSON.Net
{
    using Newtonsoft.Json;

    public class Video : IVideo
    {
        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("link")]
        public Link Link { get; set; }   

        public override string ToString()
        {
            return Title + " " + Link;
        }
    }
}