const BASE_URL= 'https://api.mapbox.com/directions/v5/mapbox'

export async function getDirections(from, to) {
  const response = await fetch(
    `${BASE_URL}/walking/${from[0]},${from[1]};${to[0]},${to[1]}?alternatives=false&continue_straight=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=sk.eyJ1IjoicmF5aGFuYXN5cmFmZiIsImEiOiJjbHpxeWtubXMxZHpsMmlyN21sOGJ0eHc0In0.LZz-V5Q4gtkF2JLmlcWF-A`
  )
  const json = await response.json()
  return json;
}