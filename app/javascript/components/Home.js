import React from "react"
import PropTypes from "prop-types"
import './styles/Feed.css';
import like from './assets/like.svg';
import unlike from './assets/unlike.svg';
import api from './services/api'


class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUserId: this.props.currentUserId,
      feed: [],

    };
  }


  async componentDidMount() {
    //this.registerToSocket();

    const response = await api.get('api/v1/buildings', {
        params: {
          user_id: this.state.currentUserId
        }
    });
    await console.log(response);
    await console.log(this.props)
    await this.setState({ feed: response.data });

  }

  registerToSocket = () => {
    const socket = io(`http://localhost:3333`);

    socket.on('post', newPost => {
      this.setState({ feed: [newPost, ...this.state.feed] });

    })

    socket.on('like', likedPost => {
      this.setState({
        feed: this.state.feed.map(post =>
          post._id === likedPost._id ? likedPost : post
        )

      });


    })
  }


  handleLike = id => {
    //api.post(`/posts/${id}/like`);
    console.log("favorited")
    console.log(id)
  }

  render() {
    return (
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
                <button type="button" onClick={() => this.handleLike(post.id)}>
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
    );
  }
}

Home.propTypes = {
  currentUserId: PropTypes.string
};
export default Home
