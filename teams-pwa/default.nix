{ 
stdenv
, lib
, copyDesktopItems
, makeDesktopItem
, chromium
, google-chrome
, imagemagick
, ...
}:

let
  mkTeamsForBrowser = (browser:
    stdenv.mkDerivation (final: {
      pname = "teams-pwa";
      name = final.pname;
      nativeBuildInputs = [ imagemagick copyDesktopItems ];
      dontUnpack = true;

      desktopItems = [
        (makeDesktopItem {
          name = final.pname;
          icon = final.pname;
          exec = "${browser}/bin/${browser.meta.mainProgram or browser.pname} --app=https://teams.microsoft.com";
          desktopName = "Microsoft Teams PWA";
          genericName = "Progressive Web App for Microsoft Teams";
          categories = [ "Network" ];
          mimeTypes = [ "x-scheme-handler/msteams" ];
        })
      ];

      postInstall = ''
        for size in 32 48 64 128 256; do
          mkdir -pv $out/share/icons/hicolor/"$size"x"$size"/apps
          convert -resize "$size"x"$size" ${./teams.svg} \
            $out/share/icons/hicolor/"$size"x"$size"/apps/${final.pname}.png
        done
      '';

      meta = with lib; {
        description = "Microsoft Teams PWA";
        homepage = "https://teams.microsoft.com";
        maintainers = with maintainers; [ ners ];
        platforms = browser.meta.platforms;
      };
    })
  );
in
{
  chromium = mkTeamsForBrowser chromium;
  google-chrome = mkTeamsForBrowser google-chrome;
}
