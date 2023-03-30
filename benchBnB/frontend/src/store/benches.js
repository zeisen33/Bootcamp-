import csrfFetch from "./csrf";


const SET_BENCHES = 'benches/setBenches'
const ADD_BENCH = 'benches/addBench'

export const setBenches = (benches) => {
    // debugger
    return (
        {
            type: SET_BENCHES,
            benches: benches
        }
    )
}

export const addBench = (benchData) => {
    debugger
    return (
        {
            type: ADD_BENCH,
            benchData: benchData
        }
    )
}

export const fetchBenches = () => async (dispatch) => {
    const res = await csrfFetch('/api/benches')

    const data = await res.json();
    dispatch(setBenches(data))
}

export const fetchBench = (benchId) => async (dispatch) => {
    const res = await csrfFetch(`/api/benches/${benchId}`, {
        method: 'GET'
    })

    const data = await res.json();
    dispatch(addBench(data))
}

export const createBench = (benchData) => async (dispatch) => {
    const res = await csrfFetch(`/api/benches`, {
        method: 'POST',
        body: JSON.stringify(benchData)
    })

    const data = await res.json();
    dispatch(addBench(data))
}

const benchesReducer = (state={}, action) => {
    // debugger
    Object.freeze(state);
    let nextState = { ...state };

    switch (action.type) {
        case SET_BENCHES:
            return { ...state, ...action.benches }
        case ADD_BENCH:
            // debugger
            const benchId = action.benchData.id
            nextState[benchId] = action.benchData
            return nextState
        default:
            return state
    }
}


export default benchesReducer;