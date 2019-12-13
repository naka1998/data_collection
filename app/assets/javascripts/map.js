let markers = [];
let map;
// これ付けないとエラー吐く
window.addEventListener('DOMContentLoaded', function () {
  const currentPositionBtn = document.getElementById("currentPositionBtn");
  currentPositionBtn.addEventListener('click', getPlace, false);
})
window.onload = () => {
  const lat = 35.465809;
  const lng = 139.6223;
  const initialPositon = { lat: lat, lng: lng };
  initMap(initialPositon);
}
// 初期化処理(position={lat: float, lng: float})
const initMap = (position) => {
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: position
  });
  map.addListener("click", (e) => {
    // marker.setMap(null);
    setPin(e.latLng);
    for (let i = 0; i < markers.length - 1; i++) {
      markers[i].setMap(null);
    }
  });
};

// 指定された場所にピン指して移動する
const setPin = (latlng) => {
  const marker = new google.maps.Marker({
    position: latlng,
    map: map,
  });
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

