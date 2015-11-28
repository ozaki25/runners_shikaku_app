@QuestionView = React.createClass
  getInitialState: ->
    return {
      question: @props.question
      classification: @props.classification
    }
  render: ->
    headerMessage = "#{@state.classification.category} 第#{@state.classification.timeOfCategory}回"
    return(
      `<div className="panel panel-info">
        <QuestionHeader headerMessage={headerMessage} />
        <div className="panel-body">
          <QuestionBody question={this.state.question} />
        </div>
      </div>`
    )

@QuestionHeader = React.createClass
  render: ->
    headerMessage = this.props.headerMessage
    return(
      `<div className="panel-heading">
        <strong>{headerMessage}</strong>
      </div>`
    )

@QuestionBody = React.createClass
  render: ->
    return(
      `<div>
        <Question question={this.props.question} />
      </div>`
    )

@Question = React.createClass
  render: ->
    question = @props.question
    questionNo = question.num_of_exam
    questionPath = question.question_path
    return(
      `<div>
        <h4>問{questionNo}</h4>
        <img src={questionPath} alt={questionPath} />
      </div>`
    )
