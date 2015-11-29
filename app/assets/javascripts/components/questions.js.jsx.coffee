@QuestionView = React.createClass
  getInitialState: ->
    return {
      question: @props.question
      classification: @props.classification
      mode: 'question'
      result: ''
    }
  handleAnswer: (answer)->
    @setState mode: 'answer', result: @state.question.collect_no == answer.answer
  nextQuestion: (answer)->
    answre = answer
    url = "/"
    $.ajax
      context: @
      url: url
      dataType: 'json'
      type: 'POST'
      data: {answer: answer}
    .done ->
      console.log 'success!'
    .fail ->
      console.log 'failed!'
  render: ->
    headerMessage = "#{@state.classification.category} 第#{@state.classification.timeOfCategory}回"
    return(
      `<div className="panel panel-info">
        <QuestionHeader headerMessage={headerMessage} />
        <div className="panel-body">
          <QuestionBody question={this.state.question} mode={this.state.mode} result={this.state.result} onAnswer={this.handleAnswer} />
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
  resultView: ->
    return `<Result result={this.props.result} />` if @props.mode is 'answer'
  render: ->
    question = @props.question
    return(
      `<div>
        {this.resultView()}
        <Question question={question} />
        <Choice question={question} mode={this.props.mode} onAnswer={this.props.onAnswer} />
      </div>`
    )

@Result = React.createClass
  render: ->
    result = @props.result
    message = if result then '◯正解' else '×不正解'
    return(
      `<h3>
        <span className={result ? 'bg-success' : 'bg-danger'}>{message}</span>
      </h3>`
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

@Choice = React.createClass
  render: ->
    question = @props.question
    choicePath = question.choice_path
    return(
      `<div>
        <h4>解答</h4>
        <img src={choicePath} alt={choicePath} />
        <AnswerForm mode={this.props.mode} collectNo={question.collect_no} onAnswer={this.props.onAnswer} />
      </div>`
    )

@AnswerForm = React.createClass
  render: ->
    mode = @props.mode
    collectNo = @props.collectNo
    onAnswer = @props.onAnswer
    valueList = ["a", "b", "c", "d"]
    return(
      `<div>
        {valueList.map(function(n, i) {
          return <AnswerButton key={i} value={n} mode={mode} collectNo={collectNo} onAnswer={onAnswer} />
        })}
      </div>`
    )

@AnswerButton = React.createClass
  onClick: (answer)->
    @props.onAnswer({answer})
  render: ->
    value = @props.value
    className = if @props.mode is 'answer' && value is @props.collectNo then 'btn btn-primary btn-answer' else 'btn btn-info btn-answer'
    return `<button a="toge" onClick={this.onClick.bind(this, value)} className={className}>{value}</button>`
