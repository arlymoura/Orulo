import React from "react"
import PropTypes from "prop-types"
import './styles/Feed.css';
import like from './assets/like.svg';
import unlike from './assets/unlike.svg';
import api from './services/api';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUserId: this.props.currentUserId,
      feed: [],

    };
  }


  async componentDidMount() {

    const response = await api.get('api/v1/buildings', {
      params: {
        user_id: this.state.currentUserId
      }
    });
    await this.setState({ feed: response.data });

  }

  async handleLike(building) {

    await api.get('api/v1/building_favorited', {
      params: {
        user_id: this.state.currentUserId,
        favorited: building.favorited,
        building_id: building.id
      }
    });

    await this.setState({
      feed:
        this.state.feed.map(obj => {
          if (obj.id == building.id) {
            obj.favorited = !obj.favorited
          }
          return obj
        })
    })

  }

  render() {
    return (
      <React.Fragment>
        <section id="post-list">
          {this.state.feed.map(post => (
            <article key={post.id}>
              <header>
                <div className="user-info">
                  <span> {post.finality}</span>
                  <span className="place"> {post.name} </span>
                </div>
              </header>
              <img src={post.default_image['520x280']} alt="" />
              <footer>
                <div className="actions" >
                  <button type="button" onClick={() => { this.handleLike(post) }}>
                    <img src={post.favorited ? like : unlike} alt="" />
                  </button>
                </div>
                <strong>{post.likes}Descrição</strong>
                <p>
                  {post.description}
                </p>
              </footer>
            </article>
          ))}
        </section>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  currentUserId: PropTypes.string
};
export default Home
