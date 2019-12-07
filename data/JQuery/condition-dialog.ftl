<div id="condition-dialog" title="Add New Condition"><div id="condition-scroll">
	<form action="#">
 
  <fieldset>
    <label for="name-select">Condition Name</label></br>
    <input name="name-select" type="text" id="name-select"></input></br></br>
 
    <label for="rounds-select">Number of Rounds (-1 for indefinite)</label></br>
    <input name="rounds-select" type="number" id="rounds-select"></input></br></br>
 
    <label for="conditions-select">Select Modifiers</label></br>
    <span style="position:relative;"><select multiple="multiple" name="conditions-select" id="conditions-select">
      <option>Attack</option>
      <option>Damage</option>
      <option>Fortitude</option>
      <option>Reflex</option>
      <option>Will</option>
      <option>Saves</option>
      <option>AC</option>
	  <option>Strength</option>
	  <option>Dexterity</option>
	  <option>Constitution</option>
	  <option>Intelligence</option>
	  <option>Wisdom</option>
	  <option>Charisma</option>
	  <option>Dice</option>
    </select></span></br>
	<span id="values-select"></span></br>
	<label for="desc-select">Additional Description</label></br>
    <textarea name="desc-select" id="desc-select"></textarea></br></br>
    <button name="submit-select" type="button" id="submit-select">Submit</button></br>
  </fieldset>
 
</form>
</div></div>