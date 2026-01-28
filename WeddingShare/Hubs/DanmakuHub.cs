using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

namespace WeddingShare.Hubs
{
    public class DanmakuHub : Hub
    {
        public async Task SendMessage(string message, string galleryId)
        {
            if (string.IsNullOrWhiteSpace(galleryId))
                return;
                
            await Clients.Group(galleryId).SendAsync("ReceiveMessage", message);
        }

        public async Task JoinGroup(string galleryId)
        {
            if (string.IsNullOrWhiteSpace(galleryId))
                return;
                
            await Groups.AddToGroupAsync(Context.ConnectionId, galleryId);
        }
    }
}
