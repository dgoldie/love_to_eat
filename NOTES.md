
["4","11","lv:phx-F2j5MAFWrQSiCQCH","phx_reply",{"status":"ok","response":{"diff":{"1":{"0":""},"e":[["add-unavailable-dates",{"to":"2023-06-15","from":"2023-06-12"}]]}}}]

["4","8","lv:phx-F2kNpd1gQAREqxSB","phx_reply",{"status":"ok","response":{"diff":{"e":[["new_trucks",{"new_trucks":


[{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"STOCKTON ST: 04TH ST \\ ELLIS ST \\ MARKET ST intersection","dayshours":"","food_items":"Soft pretzels: hot dogs: sausages: chips: popcorn: sodea: coffee: espresso: cappucino: pastries: ice cream: Italian sausages: shish-ka-bob: churros: juice: water: various drinks.","latitude":"37.785469746489916","longitude":"-122.40661576107294","location":"(37.785469746489916, -122.40661576107294)"},{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"STOCKTON ST: OFARRELL ST to GEARY ST (100 - 199)","dayshours":"","food_items":"Soft Pretzels: hot dogs: sausage: chips: popcorn: soda: espresso: cappucino: pastries: ice cream: italian sausages: shish-ka-bob: churros: juice: water: various drinks","latitude":"37.786856111883054","longitude":"-122.40689189299718","location":"(37.786856111883054, -122.40689189299718)"},{"applicant":"Subs on Hubs","location_description":"","dayshours":"Sa-Su:11AM-10PM;Mo-Fr:6PM-8PM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.7714019465879","longitude":"-122.3917716468468","location":"(37.7714019465879, -122.3917716468468)"},{"applicant":"The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs","location_description":"MARKET ST: 04TH ST \\ ELLIS ST \\ STOCKTON ST to POWELL ST (800 - 890) -- NORTH --","dayshours":"","food_items":"Soft pretzels: hot dogs: sausages: chips: popcorn: soda: espresso: cappucino: pastry: ica cream: ices: italian sausage: shish-ka-bob: churros: juice: water: various drinks","latitude":"37.78511092044776","longitude":"-122.40742266827704","location":"(37.78511092044776, -122.40742266827704)"},{"applicant":"Subs on Hubs","location_description":"08TH ST: FOLSOM ST to RINGOLD ST (300 - 341)","dayshours":"Th/Fr:12AM-2AM;We/Th:11PM-12AM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.77497549982167","longitude":"-122.40938582319421","location":"(37.77497549982167, -122.40938582319421)"},{"applicant":"Subs on Hubs","location_description":"BRANNAN ST: 08TH ST to 09TH ST (900 - 999)","dayshours":"Mo/Tu/We/Th:11AM-6PM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.7711790005481","longitude":"-122.40657367342877","location":"(37.7711790005481, -122.40657367342877)"},{"applicant":"Subs on Hubs","location_description":"05TH ST: HARRISON ST \\ I-80 W OFF RAMP to PERRY ST (400 - 449)","dayshours":"Sa-Su:12AM-2AM;Fr/Sa:11PM-12AM","food_items":"Italian subs: Cuban sandwich: Gyro","latitude":"37.77871039190089","longitude":"-122.4018393503297","location":"(37.77871039190089, -122.4018393503297)"}]}]]}}}]

    <%!-- <% select(f, for(:food_id), on_change={"food"} Enum.map(@food_types, fn food_type -> { food_type, String.capitalize(food_type)} end)) --%>


  <.form let={f} for={:food} phx-change="food-update">
    <%= label f, :food, class: "block text-sm font-medium text-gray-700" %>
    <%= select f, :food, Enum.map(@food_types, &(String.capitalize(&1))), class: "block w-full px-3 py-2 mt-1 bg-indigo-600 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" %>
   <./form>


     <form>
    <%= select(form, :role, ["Admin": "admin", "User": "user"], prompt: "Choose your role") %>
  </form>

  <form phx-change="update">
    <label>
          Food Type
          <div>

          </div>
    </label>
  </form>


    <div>​
    <.form​
      for={​:gender_filter​}​
      phx-change="​gender_filter"​​
      phx-target={@myself}​ 
      id="​gender-form"​​
    >​ 
     <label>By ​gender:​</label>​ 
     <select name="​gender_filter"​ id="​gender_filter"​>​
       <%= for gender <-
         [
           "​all",
           "female",​
           "​​male"​,​
           "​​other"​,​
           ​"​​prefer not to say"​​
         ] ​do​ %>​
         <option value={gender} selected={@gender_filter == gender}>​
           <%= gender %>​
         </option>​
       <% ​end​ %>​ 
     </select>​ 
    </.form>​ 
  </div>​ 
<div>​ 
<.form​ 
  for={​:age_group_filter​}​
  phx-change=​"​​age_group_filter"​​
  phx-target={@myself}​ 
  id=​"​​age-group-form"​​ 
>​ 
  <label>By age ​group:​</label>​ 
  <select name=​"​​age_group_filter"​
  id=​"​​age_group_filter"​>​ 
  <%= for age_group <-​         [
    ​"​​all"​, ​"​​18 and under"​, ​"​​18 to 25"​, ​"​​25 to 35"​, ​"​​35 and up"​] ​do​
  %>​ 
     <option value={age_group} selected={@age_group_filter == age_group}>​ 
       <%= age_group %>​ 
    </option>​ 
  <% ​end​ %>

    <button phx-click="find-trucks-by-food" phx-value-food="italian" type="button" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
    Add Italian trucks to map
  </button>
  <button phx-click="find-trucks-by-food" phx-value-food="mexican" type="button" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
    Add Mexican trucks to map
  </button>

 <div class="bg-gray-50 text-indigo-700 border border-4 border-gray-200 h-60 flex justify-center">
    <div class="mx-4 self-center text-center text-indigo-600">
      <h1 class="text-4xl sm:text-6xl font-bold tracking-tight">LOVE TO EAT</h1>
      <h2 class="text-2xl"> Maps of food trucks</h2>
      <div>
        <ul class="my-4 px-4 py-2 text-sm font-medium text-gray-900 bg-white rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          <li>
            <.link patch={~p"/map"} class="block w-full px-4 py-2 text-blue-700 visited:text-purple-600 bg-gray-300 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">
              San Francisco
            </.link>
          </li>
          <li>
            <.link patch={~p"/#"} class="block w-full px-4 py-2 text-white bg-blue-700 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">
                New York
            </.link>
          </li>
          <li>
            <.link patch={~p"/#"} class="block w-full px-4 py-2 text-white bg-blue-700 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">
              Denver
            </.link>
          </li>
          <li>
            <.link patch={~p"/#"} class="block w-full px-4 py-2 text-white bg-blue-700 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">
              Miami
            </.link>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <p>***************** good one ************************</p>
