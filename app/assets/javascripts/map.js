let markers = [];
let init_markers = [];
let map;
// これ付けないとエラー吐く
window.addEventListener('DOMContentLoaded', function () {
  const currentPositionBtn = document.getElementById("currentPositionBtn");
  currentPositionBtn.addEventListener('click', getPlace, false);
  const setButton = document.getElementsByClassName("setButton");
  for(let i = 0; i < setButton.length; i++){
    setButton[i].addEventListener('click',(e) =>{
      const location = {lat: Number(e.target.getAttribute("lat")), lng: Number(e.target.getAttribute("lng"))}
      map.panTo(location);
  } ,false);
  }

});
window.onload = () => {
  const lat = 35.465809;
  const lng = 139.6223;
  const initialPositon = { lat: lat, lng: lng };
  const pins = JSON.parse(document.getElementById("pins_data").getAttribute("data"));
  initMap(initialPositon, pins);
}
// 初期化処理(position={lat: float, lng: float})
const initMap = (position, pins) => {
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: position
  });
  showAllPins(pins);
  map.addListener("click", (e) => {
    setPin(e.latLng);
    for (let i = 0; i < markers.length - 1; i++) {
      markers[i].setMap(null);
    }
  });
};
// 指定された場所のピンを作成
const createPin = (latlng, icon = "https://maps.google.com/mapfiles/ms/icons/red-dot.png") => {
  const marker = new google.maps.Marker({
    position: latlng,
    map: map,
    icon: icon,
  });
  return marker;
};

// pinsの中身全部ピン指す
const showAllPins = (pins) => {
  const icon = "https://maps.google.com/mapfiles/ms/icons/blue-dot.png";
  for (let i = 0; i < pins.length; i++) {
    const pin = { lat: pins[i].lat, lng: pins[i].lng };
    init_markers.push(createPin(pin, icon));
  }
};
// 指定された場所にピン指して移動する
const setPin = (latlng) => {
  const marker = createPin(latlng);
  markers.push(marker);
  map.panTo(latlng);
  showLocation(marker.position);
};

// 指定された場所の緯度経度を表示する
const showLocation = (latlng) => {
  const lat = latlng.lat();
  const lng = latlng.lng();
  if (document.getElementById("create") !== null) {
    const create = document.getElementById("create");
    if (`${create.href}`.indexOf("?") != -1) {
      const temp = `${create.href}`.split("?");
      const hrefstr = `${temp[temp.length - 2]}?lat=${lat}&lng=${lng}`;
      document.getElementById("create").href = hrefstr;
    } else {
      const hrefstr = `${create.href}?lat=${lat}&lng=${lng}`;
      document.getElementById("create").href = hrefstr;
    }
  }

  if (
    document.getElementById("lat") !== null &&
    document.getElementById("lng") !== null
  ) {
    document.getElementById("lat").value = lat;
    document.getElementById("lng").value = lng;
  }
};

// 現在地を取得する
const getPlace = () => {
  //Geolocation apiがサポートされていない場合
  if (!navigator.geolocation) {
    alert("Geolocationはあなたのブラウザーでサポートされておりません");
    return;
  }
  const success = (pos) => {
    const currentPosition = { lat: pos.coords.latitude, lng: pos.coords.longitude };
    setPin(currentPosition);
  };
  const error = () => {
    console.log("error");
  };
  // getCurrentPositionのオプション
  const options = {
    enableHighAccuracy: false,
    timeout: 5000,
    maximumAge: 0
  };
  navigator.geolocation.getCurrentPosition(success, error, options);
};

