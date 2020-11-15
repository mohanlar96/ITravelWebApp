    // This sample uses the Autocomplete widget to help the user select a
    // place, then it retrieves the address components associated with that
    // place, and then it populates the form fields with those details.
    // This sample requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script
    // src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
    let placeSearch;
    let autocomplete;
    const componentForm = {
    street_number: "short_name",
    route: "long_name",
    locality: "long_name",
    administrative_area_level_1: "short_name",
    country: "long_name",
    postal_code: "short_name",
};

    function initAutocomplete() {
    // Create the autocomplete object, restricting the search predictions to
    // geographical location types.
    autocomplete = new google.maps.places.Autocomplete(
    document.getElementById("autocompleteDep"),
          { types: ["geocode"] }
        );
        // Avoid paying for data that you don't need by restricting the set of
        // place fields that are returned to just the address components.
        autocomplete.setFields(["address_component"]);
        // When the user selects an address from the drop-down, populate the
        // address fields in the form.
        autocomplete.addListener("place_changed", fillInAddress("autocompleteDep"));

        autocomplete = new google.maps.places.Autocomplete(
            document.getElementById("autocompleteDest"),
            { types: ["geocode"] }
        );
        // Avoid paying for data that you don't need by restricting the set of
        // place fields that are returned to just the address components.
        autocomplete.setFields(["address_component"]);
        // When the user selects an address from the drop-down, populate the
        // address fields in the form.
        autocomplete.addListener("place_changed", fillInAddress("autocompleteDest"));
      }

      function fillInAddress(paramVal) {
        // Get the place details from the autocomplete object.
        const place = autocomplete.getPlace();
        let str="";

        // for (const component in componentForm) {
         
        //   document.getElementById(component).value = "";
        //   document.getElementById(component).disabled = false;
        // }

        // Get each component of the address from the place details,
        // and then fill-in the corresponding field on the form.
        for (const component of place.address_components) {
          const addressType = component.types[0];

          if (componentForm[addressType]) {
            const val = component[componentForm[addressType]];
            // document.getElementById(addressType).value = val;
            if(val!=""){
              str+=val+",";
    }

    }
    document.getElementById(paramVal).value = str;



        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        // if (navigator.geolocation) {
        //   navigator.geolocation.getCurrentPosition((position) => {
        //     const geolocation = {
        //       lat: position.coords.latitude,
        //       lng: position.coords.longitude,
        //     };
        //     document.getElementById(latitude).value = position.coords.latitude;
        //     document.getElementById(longitude).value = position.coords.longitude;
        //       const circle = new google.maps.Circle({
        //       center: geolocation,
        //       radius: position.coords.accuracy,
        //     });
        //     autocomplete.setBounds(circle.getBounds());
        //   });
        // }
          console.log("geolocate.js need to put billing address at api and comment on");
      }
