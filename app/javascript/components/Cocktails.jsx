import React from "react"
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

const cocktailIngredients = (ingredients) => {
  return ingredients.map(ingredient => ingredient.name).join(', ')
}

const Cocktails = ({ cocktails }) => {
  return (
    <>
      <h1>Test</h1>
      <table>
        <thead>
          <tr>
            <th>User</th>
            <th>Title</th>
            <th>Ingredients</th>
            <th>Image</th>
            <th>Description</th>
            <th>Directions</th>
            <th colSpan="3"></th>
          </tr>
        </thead>

        <tbody>
          {cocktails.map(cocktail => (
            <tr key={cocktail.id}>
              <td>{cocktail.user.login}</td>
              <td>{cocktail.title}</td>
              <td>{cocktailIngredients(cocktail.ingredients)}</td>
              <td>{cocktail.image.thumb.url ? <img src={cocktail.image.thumb.url} alt="Image" /> : ''}</td>
              <td>{cocktail.description}</td>
              <td dangerouslySetInnerHTML={{ __html: cocktail.directions }}></td>
            </tr>
          ))
          }
        </tbody>
      </table>
      <Link to={`/cocktails/new`} activeClassName="active">Создать коктейль</Link>
    </>
  );
}

export default Cocktails
