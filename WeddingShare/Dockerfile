# 1. 基礎映像檔
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
# 修改：配合 docker-compose 的 8080 設定
EXPOSE 8080

# 2. 增加這段：安裝 curl (為了解決 Healthcheck 失敗問題)
# 微軟映像檔基於 Debian，必須用 apt-get 安裝
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# 3. 建置環境
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["WeddingShare/WeddingShare.csproj", "WeddingShare/"]
RUN dotnet restore "./WeddingShare/WeddingShare.csproj"
COPY . .
WORKDIR "/src/WeddingShare"
RUN dotnet build "./WeddingShare.csproj" -c $BUILD_CONFIGURATION -o /app/build

# 4. 發布
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./WeddingShare.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# 5. 最終執行環境
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WeddingShare.dll"]